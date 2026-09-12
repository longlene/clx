# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ${PV} tracks the Ubuntu kernel package version as <kernelver>.<abi>.<upload>,
# e.g. 7.0.0.1016.16 <-> linux-image-7.0.0-1016-nvidia 7.0.0-1016.16~24.04.1.
# This particular upload is a noble (24.04) backport of the newer 7.0 series
# - upstream's own version string carries a "~24.04.1" suffix that Gentoo's
# PV syntax can't represent, so it's appended separately below.
MY_KV_FULL="${PV%.*.*}"
MY_UBUNTU_PKG="${PV#${MY_KV_FULL}.}"
MY_KV_SERIES="${MY_KV_FULL%.*}"
MY_ABI="${MY_UBUNTU_PKG%.*}"
MY_KVER="${MY_KV_FULL}-${MY_ABI}"
MY_BACKPORT="~24.04.1"
MY_FULLVER="${MY_KV_FULL}-${MY_UBUNTU_PKG}${MY_BACKPORT}"

MY_IMAGE_DEB="linux-image-${MY_KVER}-nvidia_${MY_FULLVER}_arm64.deb"
MY_MODULES_DEB="linux-modules-${MY_KVER}-nvidia_${MY_FULLVER}_arm64.deb"
MY_HEADERS_DEB="linux-headers-${MY_KVER}-nvidia_${MY_FULLVER}_arm64.deb"
# The flavour headers deb above symlinks (with absolute paths) into this
# separate arch-generic headers package for the bulk of arch/arm64/* content
# (Makefiles, uapi/asm headers, vdso sources) - without it, the flavour
# headers tree is unbuildable (dangling symlinks for essential files).
MY_HEADERS_COMMON_DEB="linux-nvidia-${MY_KV_SERIES}-headers-${MY_KVER}_${MY_FULLVER}_all.deb"

DESCRIPTION="Prebuilt Ubuntu/NVIDIA signed kernel for the DGX Spark (GB10 Grace-Blackwell)"
HOMEPAGE="https://docs.nvidia.com/dgx/dgx-spark/"

UBUNTU_PORTS="http://ports.ubuntu.com/ubuntu-ports/pool/main/l"
SRC_URI="
	${UBUNTU_PORTS}/linux-signed-nvidia-${MY_KV_SERIES}/${MY_IMAGE_DEB}
	${UBUNTU_PORTS}/linux-nvidia-${MY_KV_SERIES}/${MY_MODULES_DEB}
	headers? (
		${UBUNTU_PORTS}/linux-nvidia-${MY_KV_SERIES}/${MY_HEADERS_DEB}
		${UBUNTU_PORTS}/linux-nvidia-${MY_KV_SERIES}/${MY_HEADERS_COMMON_DEB}
	)
"
S="${WORKDIR}"

LICENSE="GPL-2"
SLOT="${MY_KVER}"
KEYWORDS="~arm64"
IUSE="headers"
RESTRICT="binchecks mirror strip"

BDEPEND="app-arch/zstd"

src_unpack() {
	local deb data_member destdir tar_opt
	local hdr_debs=$(use headers && echo "${MY_HEADERS_DEB}" "${MY_HEADERS_COMMON_DEB}")
	for deb in "${MY_IMAGE_DEB}" "${MY_MODULES_DEB}" ${hdr_debs}; do
		destdir="${WORKDIR}/${deb%.deb}"
		mkdir -p "${destdir}" || die
		data_member=$(ar t "${DISTDIR}/${deb}" | grep -m1 '^data\.tar') \
			|| die "no data.tar member found in ${deb}"
		case "${data_member}" in
			*.zst) tar_opt="--zstd" ;;
			*.xz) tar_opt="--xz" ;;
			*.gz) tar_opt="-z" ;;
			*) tar_opt="" ;;
		esac
		ar p "${DISTDIR}/${deb}" "${data_member}" | tar -C "${destdir}" ${tar_opt} -xf - \
			|| die "failed to extract ${deb}"
	done
}

src_install() {
	local imgdir="${WORKDIR}/${MY_IMAGE_DEB%.deb}"
	local moddir="${WORKDIR}/${MY_MODULES_DEB%.deb}"

	insinto /boot
	newins "${imgdir}"/boot/vmlinuz-*-nvidia "vmlinuz-${MY_KVER}-nvidia"
	doins "${moddir}"/boot/System.map-*-nvidia
	doins "${moddir}"/boot/config-*-nvidia

	dodir /lib/modules
	cp -a "${moddir}"/lib/modules/. "${D}/lib/modules/" || die

	if use headers; then
		local hdrdir="${WORKDIR}/${MY_HEADERS_DEB%.deb}"
		local hdrcommondir="${WORKDIR}/${MY_HEADERS_COMMON_DEB%.deb}"
		dodir /usr/src
		# Install both side by side under /usr/src, matching the layout Debian
		# itself uses - the flavour headers tree's absolute symlinks expect the
		# common headers package to live at this exact sibling path.
		cp -a "${hdrdir}"/usr/src/. "${D}/usr/src/" || die
		cp -a "${hdrcommondir}"/usr/src/. "${D}/usr/src/" || die

		# The raw Makefile's VERSION/PATCHLEVEL/SUBLEVEL reflect whatever
		# upstream point-release Canonical branched from (e.g. 7.0.12), not
		# Ubuntu's own package version (7.0.0-1016-nvidia, what actually ends
		# up in include/config/kernel.release and the module vermagic).
		# linux-info.eclass's get_version() tries to reconcile the two by
		# checking whether kernel.release starts with the Makefile-derived
		# version string - since Ubuntu's numbering doesn't share that
		# prefix, the check silently fails and it computes the wrong
		# KV_FULL, which then fails linux-mod-r1's post-build vermagic
		# sanity check even though the actual module (built using the
		# correct kernel.release via kbuild itself) is fine. Force the
		# Makefile fields to match kernel.release exactly so eclass-side
		# version bookkeeping agrees with reality.
		local kv_major kv_minor kv_patch
		IFS=. read -r kv_major kv_minor kv_patch <<<"${MY_KV_FULL}"
		local hdr_makefile="${D}/usr/src/linux-headers-${MY_KVER}-nvidia/Makefile"
		sed -i \
			-e "s/^VERSION = .*/VERSION = ${kv_major}/" \
			-e "s/^PATCHLEVEL = .*/PATCHLEVEL = ${kv_minor}/" \
			-e "s/^SUBLEVEL = .*/SUBLEVEL = ${kv_patch}/" \
			-e "s/^EXTRAVERSION =.*/EXTRAVERSION = -${MY_ABI}-nvidia/" \
			"${hdr_makefile}" || die
	fi
}

pkg_postinst() {
	# Modules are copied in verbatim from the Ubuntu deb, not built by
	# portage's usual kernel-module machinery, so nothing else generates
	# modules.dep/modules.alias - without this, modprobe can't find modules
	# that are physically present (silently missing the whole AF_ALG crypto
	# stack that iwd needs, for example). Always (re)build the index for the
	# version we just installed, whether or not it's the running kernel.
	depmod -a "${MY_KVER}-nvidia"

	if use headers; then
		# Mirrors sys-kernel/gentoo-kernel-bin's /usr/src/linux symlink
		# handling (kernel-install.eclass -> dist-kernel_update_src_symlink),
		# adapted to this package's own headers-tree naming: only touch the
		# symlink if it is unset, broken, or already pointing at one of our
		# own (possibly older) headers trees - never clobber a symlink
		# pointing at some other kernel package the user set up deliberately.
		# This is what lets x11-drivers/nvidia-drivers (or any other
		# out-of-tree kernel module) find a matching build tree automatically.
		local target="${EROOT}/usr/src/linux"
		local hdrdir="linux-headers-${MY_KVER}-nvidia"
		if [[ ! -e ${target} || ! -e ${target}/Makefile || $(readlink "${target}") == linux-headers-*-nvidia ]]; then
			ln -f -n -s "${hdrdir}" "${target}" || die
			elog "Updated ${target} -> ${hdrdir}"
		else
			elog "${target} points at another kernel, leaving it as-is."
			elog "Symlink it to ${EROOT}/usr/src/${hdrdir} manually if you want"
			elog "nvidia-drivers (or other out-of-tree modules) to build"
			elog "against this kernel."
		fi
	fi

	elog "Installed the stock Ubuntu/NVIDIA signed kernel ${MY_KVER}-nvidia"
	elog "(newer 7.0 series HWE-style backport for 24.04, not yet validated"
	elog "against GB10-specific hardware-enablement patches) to:"
	elog "  /boot/vmlinuz-${MY_KVER}-nvidia"
	elog "  /lib/modules/${MY_KVER}-nvidia/"
	elog ""
	elog "This is prebuilt and unconfigurable. For a from-source, configurable"
	elog "kernel targeting the same hardware, see sys-kernel/dgx-spark-kernel."
	elog ""
	elog "You still need to build an initramfs (e.g. dracut) referencing this"
	elog "kernel version and modules directory, and point your bootloader at it."
}

pkg_postrm() {
	# Avoid leaving a dangling /usr/src/linux symlink behind once the
	# headers tree it pointed at is gone.
	local target="${EROOT}/usr/src/linux"
	[[ $(readlink "${target}" 2>/dev/null) == "linux-headers-${MY_KVER}-nvidia" ]] || return 0
	rm -f "${target}"
}
