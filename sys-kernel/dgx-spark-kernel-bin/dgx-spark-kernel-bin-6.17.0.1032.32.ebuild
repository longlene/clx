# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ${PV} tracks the Ubuntu kernel package version as <kernelver>.<abi>.<upload>,
# e.g. 6.17.0.1032.32 <-> linux-image-6.17.0-1032-nvidia 6.17.0-1032.32.
MY_KV_FULL="${PV%.*.*}"
MY_UBUNTU_PKG="${PV#${MY_KV_FULL}.}"
MY_KV_SERIES="${MY_KV_FULL%.*}"
MY_ABI="${MY_UBUNTU_PKG%.*}"
MY_KVER="${MY_KV_FULL}-${MY_ABI}"
MY_FULLVER="${MY_KV_FULL}-${MY_UBUNTU_PKG}"

MY_IMAGE_DEB="linux-image-${MY_KVER}-nvidia_${MY_FULLVER}_arm64.deb"
MY_MODULES_DEB="linux-modules-${MY_KVER}-nvidia_${MY_FULLVER}_arm64.deb"
MY_HEADERS_DEB="linux-headers-${MY_KVER}-nvidia_${MY_FULLVER}_arm64.deb"

DESCRIPTION="Prebuilt Ubuntu/NVIDIA signed kernel for the DGX Spark (GB10 Grace-Blackwell)"
HOMEPAGE="https://docs.nvidia.com/dgx/dgx-spark/"

UBUNTU_PORTS="http://ports.ubuntu.com/ubuntu-ports/pool/main/l"
SRC_URI="
	${UBUNTU_PORTS}/linux-signed-nvidia-${MY_KV_SERIES}/${MY_IMAGE_DEB}
	${UBUNTU_PORTS}/linux-nvidia-${MY_KV_SERIES}/${MY_MODULES_DEB}
	headers? ( ${UBUNTU_PORTS}/linux-nvidia-${MY_KV_SERIES}/${MY_HEADERS_DEB} )
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
	for deb in "${MY_IMAGE_DEB}" "${MY_MODULES_DEB}" $(use headers && echo "${MY_HEADERS_DEB}"); do
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
		dodir /usr/src
		cp -a "${hdrdir}"/usr/src/. "${D}/usr/src/" || die
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

	elog "Installed the stock Ubuntu/NVIDIA signed kernel ${MY_KVER}-nvidia"
	elog "(same binary DGX OS boots and validates on this hardware) to:"
	elog "  /boot/vmlinuz-${MY_KVER}-nvidia"
	elog "  /lib/modules/${MY_KVER}-nvidia/"
	elog ""
	elog "This is prebuilt and unconfigurable. For a from-source, configurable"
	elog "kernel targeting the same hardware, see sys-kernel/dgx-spark-sources."
	elog ""
	elog "You still need to build an initramfs (e.g. dracut) referencing this"
	elog "kernel version and modules directory, and point your bootloader at it."
}
