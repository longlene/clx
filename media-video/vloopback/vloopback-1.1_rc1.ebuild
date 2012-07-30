# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit linux-mod eutils multilib versionator linux-info

MY_P="${PN}-$(replace_version_separator 2 '-')"
S="${WORKDIR}/${MY_P}"
DESCRIPTION="vloopback allow to create pipe of videos devices"
HOMEPAGE="http://www.lavrsen.dk/twiki/bin/view/Motion/VideoFourLinuxLoopbackDevice"
SRC_URI="http://www.lavrsen.dk/twiki/pub/Motion/VideoFourLinuxLoopbackDevice/${MY_P}.tar.gz"

IUSE="extras"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

CONFIG_CHECK="VIDEO_DEV"
MODULE_NAMES="vloopback(video:)"
BUILD_TARGETS="all"

pkg_setup() {
	ABI=${KERNEL_ABI}
	set_arch_to_kernel
	linux-mod_pkg_setup
	BUILD_PARAMS="LINUX_DIR=${KV_DIR} OUTPUT_DIR=${KV_OUT_DIR}"
}


src_unpack() {
	unpack ${A}

	cd ${S}

	if use extras; then
		epatch ${FILESDIR}/${PN}-${PV/_pre/-snap}_Makefile.patch
		epatch ${FILESDIR}/${PN}-${PV/_pre/-snap}_resize.c.patch
	fi
}

src_compile() {
	emake || die "Can not compile ${PN} module!"

	if use extras; then
		cd ${S}/example
		mv resize.c vresize.c
		emake || die "Can not compile extras!"
	fi
}

src_install() {
	linux-mod_src_install

	dodoc README*  COPYING 
	insinto /usr/share/doc/${PF}

	if use extras; then
		cd ${S}/example
		dobin vresize
		dobin invert
		dobin dummy
	fi
}

pkg_preinst() {
	linux-mod_pkg_preinst
}

pkg_postinst() {
	linux-mod_pkg_postinst

	echo	
	ewarn "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
	einfo "Using:"
	einfo "# modprobe vloopback dev_offset=1"
	einfo "# vresize /dev/video0 /dev/video1 320x240 176x144 rgb24"
	ewarn "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
	einfo "If you use quickcam.ko do this:"
	einfo "# echo 'options quickcam compatible=2' >> /etc/modules.d/quickcam"
	einfo "# modules-update && modprobe -r quickcam && modprobe quickcam"
	ewarn "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
}
