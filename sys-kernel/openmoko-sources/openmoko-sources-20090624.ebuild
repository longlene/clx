# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Andy-tracking kernel for Openmoko devices"
HOMEPAGE="http://www.openmoko.org/"
SRC_URI=""
EGIT_REPO_URI="git://git.openmoko.org/git/kernel.git"
# This needs to be the COMMIT!!!!! else the git eclass is not able
# to checkout the correct branch at the given commit!
EGIT_TREE="e03b339e05fbf46836c83d5595d4db77112b429d"
EGIT_BRANCH="andy-tracking"

ETYPE="sources"
OKV="2.6.29"
CKV="-${PVR}"

K_NOUSENAME="yes"
K_NOSETEXTRAVERSION="yes"
K_SECURITY_UNSUPPORTED="yes"

inherit git kernel-2 toolchain-funcs
detect_version

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm"

IUSE=""
DOCS=""

RDEPEND=""
DEPEND="sys-devel/gcc
	dev-embedded/u-boot-tools"

MY_P="linux-${OKV}${CKV}"
S="${WORKDIR}/${MY_P}"

src_unpack() {
	# Fetch and unpack current git sources
	git_src_unpack
}

pkg_postinst() {
	postinst_sources
	einfo "The kernel source is now installed in"
	einfo "  ${ROOT}/usr/src/linux."
	einfo "Please change to this directory to configure and build the kernel."
	einfo ""
	einfo "To use a default kernel-configuration for your device, rename one"
	einfo "of the defconfig-<device> files to .config"

	if tc-is-cross-compiler ; then
		ewarn ""
		ewarn "NOTE: If you are cross-compiling you have to run"
		ewarn "  make ARCH=arm CROSS_COMPILE=${CHOST}- INSTALL_MOD_PATH=${ROOT}"
		ewarn "instead of just"
		ewarn "  make"
		ewarn "to configure, compile and install the kernel + modules."
	fi
}
