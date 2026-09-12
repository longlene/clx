# Installing Gentoo on NVIDIA DGX Spark (GB10)

Working notes toward a wiki writeup. This is a living document, updated as
the install proceeds. Hardware: NVIDIA DGX Spark, GB10 Grace-Blackwell
Superchip, aarch64, 128GB unified memory, ships with Ubuntu-based "DGX OS".

## Why the stock Gentoo arm64 installer doesn't boot

Booting the official Gentoo arm64 minimal install media gets past GRUB fine
(UEFI firmware and GRUB use their own generic USB/storage stacks), but the
kernel drops into a dracut emergency shell with a **completely dead
keyboard** - not just "root not found", genuinely no USB input at all.

Root cause: GB10 is new enough that mainline/vanilla Linux lacks its
hardware-enablement patches. NVIDIA ships a patched Ubuntu kernel
(`linux-nvidia` flavour) as part of DGX OS; without those patches, USB
(including HID) doesn't come up under a generic kernel, even though GRUB/UEFI
had no trouble with the same USB hardware moments earlier (firmware has its
own driver stack, independent of what Linux brings up).

Confirmed by: `RageLtd/linux-dgx-spark` (community Arch package) explicitly
states "a standard kernel lacks the necessary patches" and sources from
"NVIDIA's Ubuntu kernel fork published on Launchpad". Also confirmed
empirically - a from-source build using this exact same patch set produces a
working kernel (USB/keyboard functional) once the correct config is used.

## Two working kernel options

Both live in this overlay (`sys-kernel/`), both target this exact hardware:

- **`dgx-spark-kernel-bin`**: repackages Ubuntu's *signed* `linux-image`/
  `linux-modules` debs directly (fetched from `ports.ubuntu.com`, NOT from
  any NVIDIA-hosted repo - the kernel itself is an official Ubuntu archive
  package, just built from NVIDIA's Grace-Blackwell patches). Zero compile
  time. This is the exact binary DGX OS itself boots and validates on this
  hardware - the lowest-risk option, and what was actually used for the
  working install.
- **`dgx-spark-sources`**: assembles the same Ubuntu `linux-nvidia` source
  package (orig tarball + debian diff from Launchpad) as a normal, buildable
  Gentoo kernel-sources package, with a known-good defconfig
  (`dgx_spark_defconfig`) sourced from the `RageLtd/linux-dgx-spark` project.
  Configurable, but you compile it yourself (~15-20 min on the 20-core GB10).

  Known defconfig gap (already fixed in this overlay's ebuild): upstream's
  defconfig has `CONFIG_R8127` disabled even though the driver is in-tree
  (from the Ubuntu diff) and this hardware's onboard 10GbE NIC (PCI
  `10ec:8127`) needs it, since `CONFIG_R8169` doesn't support that chip.

**Provenance note**: NVIDIA's own apt repos (`repo.download.nvidia.com/
spark/...`, `.../baseos/.../dgx`) carry only small DGX-Spark-specific
userspace/config packages (dashboard, OOBE, telemetry, a handful of
grub/modprobe/limits snippets) - no kernel or GPU driver binaries. Those come
from the official Ubuntu archive (kernel, restricted-component GPU modules)
or NVIDIA's generic CUDA repo (userspace CUDA/driver libs), not anything
DGX-Spark-exclusive.

## Required kernel command line parameters

Both kernels need these on every boot, regardless of source vs binary:

```
pci=pcie_bus_safe initcall_blacklist=tegra234_cbb_init
```

Discovered by extracting NVIDIA's own `nvidia-spark-grub-pci` and
`nvidia-spark-initcall-bl` packages (tiny packages that just drop a
`GRUB_CMDLINE_LINUX_DEFAULT` snippet into `/etc/default/grub.d/`) from a
running DGX OS install. `initcall_blacklist=tegra234_cbb_init` specifically
works around a known-bad Tegra234 CBB (Control Backbone) init call on this
SoC - omitting it risks exactly the kind of early-boot USB/hardware failure
described above.

## Kernel-install gotcha: modprobe needs a depmod pass

`dgx-spark-kernel-bin` copies `/lib/modules/<kver>/` straight out of the
Ubuntu deb. Nothing else in that flow generates `modules.dep`/
`modules.alias` - so even though the `.ko.zst` files are physically present,
freshly-installed the source `modprobe <module>` says the file doesn't
exist. This bit us specifically with iwd's AF_ALG crypto modules
(`algif_hash`, `algif_skcipher` - `CONFIG_CRYPTO_USER_API_HASH`/
`_SKCIPHER=m` in this kernel's config, so they must be loaded, and modprobe
silently can't find *any* module by name without an index) - iwd printed a
wall of "kernel crypto API missing" warnings and quit, which reads exactly
like a real capability gap but isn't one.

Fix (now baked into the ebuild's `pkg_postinst`): always run
`depmod -a <kver>-nvidia` after installing. If you ever install the modules
manually outside portage, remember to run this yourself.

## Networking: iwd renames the wireless interface

The onboard WiFi is a MediaTek MT7925 (`mt7925e` driver, PCI class `0280`
"Network controller" - **not** `0200` "Ethernet controller", which matters
for any hostonly/udev-based auto-detection that filters by PCI class).
Firmware: `sys-kernel/linux-firmware` under
`mediatek/mt7925/{WIFI_RAM_CODE_MT7925_1_1.bin,
WIFI_MT7925_PATCH_MCU_1_1_hdr.bin, BT_RAM_CODE_MT7925_1_1_hdr.bin}` -
license-masked by default (`ACCEPT_LICENSE`/`package.license` needs
`linux-fw-redistributable`).

Kernel udev naming assigns something like `wlP9s9` at boot. Once `iwd` takes
over management of the device, **it renames the interface to `wlan0`**
(observed consistently on this OpenRC + iwd + minimal-udev setup - no
systemd predictable-naming rules active). Any `net.<iface>` netifrc script
you create ahead of time needs to target `wlan0`, not whatever `ip a` shows
before iwd has started.

iwd needs its D-Bus policy file (`/usr/share/dbus-1/system.d/iwd-dbus.conf`,
shipped by the `net-wireless/iwd` ebuild itself when installed normally via
portage - only an issue if you're hand-assembling a minimal environment,
e.g. an initramfs, where you have to remember to copy it in explicitly).

WiFi profile for unattended auto-connect: `/var/lib/iwd/<SSID>.psk`,
plain-text `[Security]\nPassphrase=...` - no keyring/secrets-agent
involved, which is why headless (no GUI login) boot is fine once this file
exists, contrary to an early wrong guess that GNOME keyring was the culprit
on the stock DGX OS side.

## Chroot gotcha: bind-mounted /run leaks service restarts to the host

When installing packages into a target root via `mount --bind /run "$TARGET/run"`
(the usual Handbook chroot setup), be aware that **anything using `/run` for
PID files or service state is now shared between the host and the chroot**.
`net-misc/openssh`'s ebuild has postinst logic (bug #709748) that detects a
running sshd and restarts it "to avoid bricking the running instance" when
you're mid-upgrade over the very SSH session you're using. Run that emerge
inside a chroot with `/run` bind-mounted, and the *host's* real sshd gets
killed and replaced by a freshly-started sshd that is itself still living
inside the chroot() jail (same PID/network namespace, different filesystem
root) - it binds the same port, so remote SSH still "connects", but auth
fails because it's now reading `$TARGET/root/.ssh/authorized_keys` (empty)
instead of the host's real one. Diagnosable via `ls -la /proc/<sshd-pid>/root`
- if it doesn't point to `/`, that's the bug. Fix: kill that process and
`rc-service sshd start` from *outside* the chroot. Generalizes to any
service-restart logic triggered by other packages installed the same way,
not just openssh.

## Networking on the final install: don't use netifrc's `net.<iface>` with iwd

The final internal-disk install originally had both the global `iwd`/`dbus`
services *and* a netifrc `net.wlan0` script (`/etc/conf.d/net` with
`modules=iwd`) enabled in the default runlevel. This double-manages the
interface: netifrc's `iwd` module (`/lib/netifrc/net/iwd.sh`) tries to start
its *own* `iwd` daemon instance (via `start-stop-daemon` with a
`/run/iwd-wlan0.pid` pidfile) even though the global `iwd` service is already
running and has already associated using the saved `/var/lib/iwd/<SSID>.psk`
profile. The interface actually comes up fine (association happens via the
global iwd instance, and a `dhcpcd` process ends up getting a lease anyway),
but `rc-status` reports `net.wlan0` as **crashed**, because the two iwd
control paths step on each other and desync netifrc's own service-state
tracking. Confirmed via `iwctl station wlan0 show` (state: connected, valid
IPv4+IPv6, hundreds of seconds of connected time) while `rc-service net.wlan0
status` simultaneously said `crashed`.

Fix: don't use netifrc for iwd-managed wireless at all. Enable plain global
services instead - `rc-update del net.wlan0 default; rc-update add dhcpcd
default` - and leave `iwd`/`dbus` as they are. `dhcpcd`'s own hotplug
handling picks up whatever interface `iwd` brings up (or any wired interface)
without needing a per-interface netifrc wrapper. This matches the pattern
Gentoo's own iwd documentation recommends for headless/auto-connect setups.
(Not yet re-validated with a cold reboot at the time this was written - the
change only affects the *next* boot's service startup, it doesn't touch a
currently-live connection.)

## Stable SSH access to a headless, IP-shifting box

This box has no console attached day to day - everything is done over SSH -
and the DHCP lease isn't guaranteed to stay the same across reboots (it moved
from `.66` to `.67` on one reboot during this install). Two options were
weighed:

- **mDNS (avahi)**, so `ssh root@<hostname>.local` always works regardless of
  IP. Rejected for this box: `net-dns/avahi` pulled in a `dev-lang/perl`
  slot upgrade (5.42 -> 5.44) plus ~40 `dev-perl/*` packages as part of its
  optional HTTP/service-browsing helper scripts - a lot of weight and a
  dependency-resolution conflict for what should be a small daemon,
  especially on a box whose global `USE` deliberately sets `-perl` to avoid
  exactly this kind of pull-in (see USE flags section below).
- **Static IP via `dhcpcd.conf`** (what was actually used): pin the
  interface to the address it already had rather than requesting a lease
  each boot:

  ```
  # /etc/dhcpcd.conf
  interface wlan0
  static ip_address=192.168.0.67/24
  static routers=192.168.0.1
  static domain_name_servers=75.75.75.75 75.75.76.76
  ```

  This is a client-side pin, not a router-side DHCP reservation, so there's
  a theoretical collision risk if another device on the LAN gets handed the
  same address - acceptable on a small home network, but a router-side
  MAC-based reservation would be the more correct fix if the router admin
  UI is available. Since `dhcpcd` only reads this file on (re)start, writing
  it doesn't disrupt a currently-live SSH session - it only takes effect on
  the next boot/`dhcpcd` restart.

  Also note: the router does **not** auto-register DHCP client hostnames
  into DNS (`getent hosts <hostname>` came back empty even after the
  hostname was set), so hostname-based resolution without mDNS isn't
  available on this network either way - the static IP is currently the
  only "doesn't change on reboot" option in place.

## USE flags: headless compute/AI profile, not the desktop set

Global `USE` was intentionally *not* a blanket copy of the dev workstation's
desktop-oriented flags (that machine runs X/Wayland/Plasma/PulseAudio/
Bluetooth/Thunderbolt/etc - none of which apply to a box with no display
attached, managed entirely over SSH). What Spark actually got, filtered down
to server/compute-relevant flags only:

```
# /etc/portage/make.conf
USE="acpi btrfs crypt cuda dbus dist-kernel nvenc nvml onednn opencl terminal udev zstd -networkmanager -perl -systemd"
```

`-perl` carried over deliberately - see the avahi story above for exactly
the kind of bloat it's meant to head off. `mkl` (Intel Math Kernel Library)
was dropped even though it's set on the workstation - it's x86-only and has
no effect on arm64.

Also added, mirroring the workstation's `CPU_FLAGS_X86` tuning but for the
actual CPU in this box (Cortex-X925, read straight off `/proc/cpuinfo`
`Features:`):

```
# /etc/portage/package.use/00cpu-flags
*/* CPU_FLAGS_ARM: aes crc32 pmull sha1 sha2 sha3 sm3 sm4 sve sve2
```

Note this CPU actually reports a much longer ARMv9 feature list (`sve2`,
`svesha3`, `svesm4`, `i8mm`, `bf16`, `bti`, `wfxt`, ...) - only the subset
that matches known `CPU_FLAGS_ARM` values Gentoo ebuilds actually check
against was kept; the rest have no corresponding USE flag to enable.

Setting `USE=`/`package.use` only affects *new* merges - it does not
retroactively rebuild the packages already installed during the Handbook
walkthrough. Run `emerge --update --deep --newuse @world` to apply it
retroactively if/when that matters.

## Official Gentoo arm64 binhost

`arm64/17.0` (openrc) profile has full daily-updated binpkg coverage. Setup:

```
# /etc/portage/binrepos.conf/gentoo.conf
[gentoo]
priority = 9999
sync-uri = https://distfiles.gentoo.org/releases/arm64/binpackages/23.0/arm64
verify-signature = true
location = /var/cache/binhost/gentoo
```

(Path segment is the *profile* version - `23.0` for the current default
profile, check `readlink -f /etc/portage/make.profile` if using an older
profile.) Then `FEATURES="getbinpkg binpkg-request-signature"` and
`EMERGE_DEFAULT_OPTS="--getbinpkg"` in `make.conf`, and run `getuto` once to
set up the trust keyring. Cuts package installs (iwd, dhcpcd, openssh,
grub, btrfs-progs, gptfdisk, etc.) from "compile from source" to
"download and merge", which matters a lot on unfamiliar/new hardware where
you're already iterating a lot.

## Partition scheme used

3.7TB internal NVMe, no encryption (deliberate - this machine needs to
reboot unattended and auto-connect network; LUKS would require someone
physically present to unlock every boot):

| Partition | Size | Type | Notes |
|---|---|---|---|
| p1 | 1G | vfat (ESP) | `grub-install --target=arm64-efi` |
| p2 | 32G | swap | fixed size; 128GB unified memory means swap is a safety margin, not a working-set extension |
| p3 | rest (~3.66T) | btrfs | root |

## Rescue/install USB

A dracut-based custom rescue environment (kernel + initramfs on a small FAT32
ESP, GRUB arm64-efi, `--removable` so no NVRAM registration needed) proved
essential for iterating without risking the internal disk. Custom dracut
module bundles: dropbear (pubkey-only), iwd + a pre-seeded WiFi profile,
partitioning tools (parted/sgdisk/mkfs.btrfs/mkfs.vfat), and (deliberately
*not* via dracut's blanket `busybox` module, which force-symlinks *every*
applet it supports - including `modprobe`/`insmod` - over whatever real
binary is installed; busybox's own modprobe can't decompress `.ko.zst`
modules, which broke module loading entirely the first time this was tried).
Only `ps`/`find`/`ping`/etc. were added as explicit, individual busybox
symlinks, leaving `modprobe`/`insmod`/`mount`/`tar`/`chroot` as their real
binaries.

Built with `dracut --no-hostonly` (not `--hostonly`) after `--hostonly`
excluded USB HID drivers entirely because no keyboard happened to be
plugged into the machine at initramfs-build time (`--hostonly` only bundles
drivers for hardware it can detect as active *right then*) - a second,
independent way to end up with the same "keyboard doesn't work" symptom as
the missing-vendor-patches problem, for a completely different reason.

## Kernel upgrades: check `linux-nvidia-<series>` pools on ports.ubuntu.com

The `dgx-spark-kernel-bin` flavour isn't a one-time pin - Canonical keeps
publishing new kernel bases under the same `linux-nvidia` source package
lineage (`linux-nvidia-6.2` through `linux-nvidia-7.0` as of this writing,
found by listing `http://ports.ubuntu.com/pool/main/l/` and grepping for
`nvidia`). Upgraded from the initial `6.17.0-1032.32` (noble/24.04-native)
to `7.0.0-1016.16~24.04.1` - a *noble-targeted backport* of the newer 7.0
series, not a resolute(26.04)-only build, published 2026-08-18, one day
before the 6.17 build this box originally used. That `~24.04.1` suffix in
the upstream version string doesn't fit Gentoo's `PV` syntax, so the ebuild
carries it as a separate `MY_BACKPORT` variable appended when building
`MY_FULLVER`, rather than trying to cram it into `PV` directly.

Before trusting a new base version on real hardware, checked the extracted
`/boot/config-*` for the platform-specific bits that mattered the first
time around: `CONFIG_ARCH_TEGRA_234_SOC=y` (GB10's chip family - the thing
`initcall_blacklist=tegra234_cbb_init` refers to) was still present and
un-removed, `CONFIG_R8127=m` (the 10GbE NIC fix this overlay had to patch
into the from-source `dgx-spark-sources` build) was already enabled
upstream this time, and `CONFIG_BTRFS_FS`/`CONFIG_CRYPTO_USER_API_*`/HID-USB
config all matched. This is a config-file read, not proof the runtime
patches are equivalent - real validation only came from the actual boot.

`sys-kernel/dgx-spark-kernel-bin` is `SLOT`ted by kernel version
(`SLOT="${MY_KVER}"`), so installing a new version doesn't remove the old
one - both `/boot/vmlinuz-*`/`/lib/modules/*` trees coexist. That made it
possible to test the new kernel safely on the *already-installed* system
without an intermediate USB-validation step: add a second GRUB menuentry
for the new kernel, leave the old one as entry 0, and use a proper
`grub-reboot`-compatible one-shot mechanism so exactly one boot attempt
uses the new entry and *any* subsequent boot (including a hard power-cycle
after a hang) automatically reverts to the safe default - no physical
console interaction needed even in the failure case. Concretely, the
hand-written `grub.cfg` (not `grub-mkconfig`-generated, so this isn't free)
needs the standard boilerplate added:

```
if [ -s $prefix/grubenv ]; then
  load_env
fi
if [ "${next_entry}" ]; then
   set default="${next_entry}"
   set next_entry=
   save_env next_entry
   set boot_once=true
else
   set default="1"    # the permanent default, once validated
fi
```

then `grub-reboot <entry-index>` before the test reboot arms exactly one
attempt (confirmed via `grub-editenv /boot/grub/grubenv list` showing
`next_entry=` cleared again immediately after the successful boot). Always
run `grub-script-check` on a hand-edited `grub.cfg` before deploying it -
this file has no `grub-mkconfig` safety net, and a syntax error here risks
landing at a `grub rescue>` prompt, which *does* need physical console
access to recover from.

Validated clean on real hardware: booted in ~25s, root mounted correctly,
zero errors/warnings in `dmesg`, iwd/wlan0/dhcpcd all came up automatically
exactly like the previous kernel. Promoted to the permanent default after
this validation (entry 0 kept as the previous-known-good fallback).

## Getting x11-drivers/nvidia-drivers to build: three separate problems

Wanted CUDA/GPU compute (`x11-drivers/nvidia-drivers`), which builds an
out-of-tree kernel module (`nvidia.ko`) via `linux-mod-r1.eclass`. On this
box that hit three unrelated problems, in order:

**1. Wrong USE flags pulled in a whole unrelated kernel + desktop stack.**
`nvidia-drivers`' `dist-kernel` USE flag (globally enabled here as a
copy-paste leftover from the dev workstation's USE flags) pulls
`virtual/dist-kernel` -> `sys-kernel/gentoo-kernel` -> `sys-kernel/gentoo-sources`
(~150MB of unrelated generic kernel source, none of it GB10-patched). Its
default-on `tools` USE flag (nvidia-settings, a GUI app) pulls the entire
GTK/X11 stack on a box with no display attached. Fixed by removing
`dist-kernel` from Spark's global `USE` and setting
`x11-drivers/nvidia-drivers kernel-open -dist-kernel -tools -X -wayland` in
`package.use` (`kernel-open` because GB10, as a datacenter-class
Grace-Blackwell part, needs NVIDIA's open kernel modules - the closed
proprietary ones don't support it).

**2. `virtual/linux-sources` can't be satisfied by a custom overlay package,
full stop - not fixable via USE flags.** `linux-mod-r1.eclass` has an
*unconditional* `DEPEND="virtual/linux-sources"` (no USE gate), and that
virtual's provider list is a hardcoded `||` of specific upstream/Gentoo
packages (`gentoo-sources`, `gentoo-kernel-bin`, etc) - `dgx-spark-kernel-bin`
can never be one of them, this overlay can't add itself to Gentoo's own
`virtual/linux-sources` ebuild. The saving grace: this dependency is a pure
formality. `sys-kernel/gentoo-sources` merging with `USE=-symlink` (its
default here) just extracts a source tarball to `/usr/src/gentoo-sources-*/`
- no compile, and it never touches `/usr/src/linux`. It sits there inert
(~150MB disk) purely to satisfy the dependency graph, while the actual
build uses whatever `/usr/src/linux` is manually pointed at.

**3. Getting `/usr/src/linux` to point at something real and matching -
without compiling a whole separate kernel.** The obvious-looking answer
(build+boot `sys-kernel/dgx-spark-kernel` from source, so the build
environment is self-consistent) works but is heavyweight and adds a new
kernel-boot validation cycle. Better: `sys-kernel/gentoo-kernel-bin` itself
(the reference `virtual/linux-sources` provider that's also a binary
package) ships a real build tree at `/usr/src/linux-${KV_FULL}` alongside
its binary kernel - confirmed by reading its ebuild
(`kernel-install.eclass`). `dgx-spark-kernel-bin` already had a `headers`
IUSE flag doing the same thing (fetching Ubuntu's own
`linux-headers-*-nvidia.deb`, exactly what Ubuntu's own DKMS/out-of-tree
module workflow uses) - matching the *exact currently-running* kernel,
built by the *exact same toolchain* that built it. Better vermagic
guarantee than a separately Gentoo-compiled kernel, and no new boot cycle.

That surfaced two bugs in the `headers` USE flag path, previously untested
since nothing had exercised it:

- **Dangling symlinks**: the flavour headers deb
  (`linux-headers-<kver>-nvidia`) symlinks with *absolute* paths into a
  separate arch-generic companion package
  (`linux-nvidia-<series>-headers-<kver>_..._all.deb`) for the bulk of
  `arch/arm64/*` content (Makefiles, uapi/asm headers, vdso) - the ebuild
  only fetched the flavour deb, not its companion, so `arch/arm64/include/
  asm`, `.../uapi`, and several Makefiles were broken symlinks. Fixed by
  fetching and installing both side by side under `/usr/src`, matching
  Debian's own layout exactly (that's what the absolute symlinks expect).
- **Version-string mismatch breaking `linux-info.eclass`'s sanity check**:
  the raw kernel `Makefile`'s `VERSION`/`PATCHLEVEL`/`SUBLEVEL` reflect
  whatever upstream point-release Canonical branched from (e.g. `7.0.12`),
  *not* Ubuntu's own package version (`7.0.0-1016-nvidia`, what's actually
  in `include/config/kernel.release` and what the built module's vermagic
  correctly uses). `linux-info.eclass`'s `get_version()` tries to reconcile
  the two via a string-prefix check between the Makefile-derived version and
  `kernel.release`; since Ubuntu's numbering doesn't share that prefix, the
  check silently fails and it computes the wrong `KV_FULL` - `nvidia-drivers`
  built successfully (correct vermagic from the real `kernel.release`) but
  then failed its own post-build sanity check comparing the built module's
  version against the eclass's wrong `KV_FULL`. Fixed by patching the
  installed `Makefile`'s version fields directly (`VERSION`/`PATCHLEVEL`/
  `SUBLEVEL`/`EXTRAVERSION`) to literally reconstruct `7.0.0-1016-nvidia`,
  so eclass bookkeeping agrees with reality. (This is a well-precedented
  workaround for any vendor/HWE kernel with this kind of numbering scheme,
  not something specific to this ebuild.)

**Also added, mirroring `gentoo-kernel-bin`'s actual behavior** (confirmed
by reading `kernel-install.eclass`'s `dist-kernel_update_src_symlink`):
automatic `/usr/src/linux` symlink management in `pkg_postinst`/`pkg_postrm`
- only touches the symlink if it's unset, broken, or already pointing at one
of this package's own (older) headers trees; never clobbers a symlink
pointing at some other kernel package. Verified against all three cases in
isolation before deploying.

End state, verified on real hardware: `nvidia-drivers-615.71.09` built and
installed cleanly, `modprobe nvidia` loads with vermagic
`7.0.0-1016-nvidia SMP preempt mod_unload modversions aarch64` (exact match,
no `--force`), `NVRM: loading NVIDIA UNIX Open Kernel Module` in `dmesg`,
and `nvidia-smi` reports the GB10 GPU live (driver 615.71.09, CUDA 13.4).

## Package renamed: dgx-spark-sources -> dgx-spark-kernel

Renamed to mirror Gentoo's own `gentoo-kernel`/`gentoo-kernel-bin` naming
pair (source-buildable vs. prebuilt-binary variant of the same kernel).
`dgx-spark-kernel-bin` keeps its name (matches `gentoo-kernel-bin`'s own
"-bin" convention for the prebuilt variant).

## Final system identity

- Hostname: `spark`
- Static address: `192.168.0.67` (pinned via `dhcpcd.conf`, see above)
- Root filesystem: `/dev/nvme0n1p3`, btrfs, no encryption (deliberate, for
  unattended reboot)
- Kernel: `dgx-spark-kernel-bin` (Ubuntu-signed `7.0.0-1016-nvidia`, upgraded
  from the original `6.17.0-1032-nvidia` and validated on real hardware -
  see the kernel upgrades section above; previous kernel kept installed as
  a GRUB fallback entry)
- Root password is still the temporary placeholder set during install - see
  TODO below.

## Status / TODO

- [x] Booted a from-source and a binary GB10-patched kernel on real hardware, USB/keyboard/network all functional
- [x] Built a working, fully-automatic-network rescue/install USB
- [x] Validated a *full* Gentoo (not just kernel) boot from USB with working iwd/dhcpcd/sshd, survives a cold reboot unattended
- [x] Fresh Handbook-style install to the internal NVMe, completed and validated - the same `depmod` postinst fix worked automatically on a completely independent install, confirming it wasn't a one-off
- [x] GRUB installed to internal ESP with real NVRAM boot entry (`efibootmgr` confirms `Boot0000* Gentoo` first in order, not `--removable`)
- [x] Cold-booted from the internal NVMe unattended: `/dev/nvme0n1p3` btrfs root, `6.17.0-1032-nvidia` kernel, network auto-connected via iwd's saved profile
- [x] Swapped `net.wlan0` (netifrc) for a plain global `dhcpcd` service to fix a service-state desync (see networking section above) - re-validated with an actual cold reboot, `rc-status` now shows `dhcpcd [started]` cleanly
- [x] Pinned a static IP via `dhcpcd.conf`, re-validated across a cold reboot (`valid_lft forever`, not a fresh DHCP lease)
- [x] Applied a headless compute/AI-focused `USE`/`CPU_FLAGS_ARM` profile, filtered from the dev workstation's desktop set
- [x] Upgraded `dgx-spark-kernel-bin` from `6.17.0-1032` to `7.0.0-1016`, validated clean on real hardware, promoted to permanent GRUB default with the old kernel kept as a fallback entry
- [x] `x11-drivers/nvidia-drivers` built and loaded against the running kernel, `nvidia-smi` confirms the GB10 GPU is live (see section above) - three separate bugs found and fixed along the way (USE flags, missing companion headers deb, Makefile version-field mismatch)
- [x] Renamed `dgx-spark-sources` -> `dgx-spark-kernel` to match Gentoo's `gentoo-kernel`/`gentoo-kernel-bin` naming
- [ ] Rebuild already-installed packages against the new `USE`/`CPU_FLAGS_ARM` settings (`emerge --update --deep --newuse @world`) - flags are set but not yet retroactively applied
- [ ] Final root password / hardening pass (current root password is a temporary placeholder)
- [ ] Remove the stale `ubuntu` (old DGX OS) UEFI boot entry from NVRAM (currently harmless leftover)
- [ ] Add self to the `video` group for non-root CUDA/GPU access (`gpasswd -a <user> video`), per nvidia-drivers' own postinst note
