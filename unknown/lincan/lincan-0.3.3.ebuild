# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit linux-mod eutils

DESCRIPTION="Kernel driver for some CANBus adapter cards"
HOMEPAGE="http://www.ocera.org/"

P_="${PN}-${PV/_/-}"

# For the official releases
SRC_URI="mirror://sourceforge/ocera/${P_}.tar.gz"

# For the pre releases (experimental)
#SRC_URI="http://cmp.felk.cvut.cz/~pisa/can/${P_}.tar.gz"

S="${WORKDIR}/${P_}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"
DEPEND=""

MODULE_NAMES="can(can:${S}/src:${S})"
BUILD_TARGETS="all"
BUILD_PARAMS="KERNEL_LOCATION=${KERNEL_DIR} KERNEL_VERSION=${KV_FULL}"

pkg_setup() {
	linux-mod_pkg_setup

	if (( KV_MAJOR > 2 || KV_MINOR > 6 || KV_PATCH > 16 )); then
	  ewarn "Sorry, this ebuild is not compatible with kernel version > 2.6.16."
	  ewarn "Please emerge a newer lincan ebuild or downgrade to a kernel <= 2.6.16."
	  die "Incompatible kernel version."
	fi
}

src_unpack() {
	unpack ${A}

	cd ${S}
	sh ./switch-omk2std
}

src_compile() {
	linux-mod_src_compile
}

src_install() {
	linux-mod_src_install

	dodoc README CREDITS

	if use doc; then
	  dodoc doc/lincandoc-0.3.pdf
	fi
}

pkg_postinst() {
	linux-mod_pkg_postinst

	einfo
	einfo "Please remember to load the kernel module \"can\" with suitable"
	einfo "parameters for your specific hardware configuration. For example:"
	einfo "  modprobe can hw=ems_cpcpci io=0 baudrate=250"
	einfo
	einfo "You may add an appropriate line in /etc/modules.audoload/kernel-${KV_MAJOR}.${KV_MINOR}"
	einfo
}

pkg_postrm() {
	linux-mod_pkg_postrm
}
