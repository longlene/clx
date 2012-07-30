# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit linux-mod eutils multilib versionator linux-info  subversion


DESCRIPTION="vloopback allow to create pipe of videos devices"
HOMEPAGE="http://www.lavrsen.dk/twiki/bin/view/Motion/VideoFourLinuxLoopbackDevice"
ESVN_REPO_URI="http://www.lavrsen.dk/svn/vloopback/trunk/"
ESVN_STORE_DIR="${PORTAGE_ACTUAL_DISTDIR-${DISTDIR}}/svn-src/"


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
	ESVN_UPDATE_CMD="svn up"
        ESVN_FETCH_CMD="svn checkout"
	ESVN_STORE_DIR="${DISTDIR}/svn-src"
	subversion_src_unpack
	cd ${S} || die
}

src_compile() {
	emake || die "Can not compile ${PN} module!"
}

src_install() {
	linux-mod_src_install
	dodoc README*  COPYING 
	insinto /usr/share/doc/${PF}
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



