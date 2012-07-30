# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit base linux-info

DESCRIPTION="Manage kernel-based L2TPv3 tunnel devices"
HOMEPAGE="http://www.spinics.net/lists/netdev/msg142037.html"
SRC_URI="ftp://ftp.openl2tp.org/releases/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=dev-libs/libnl-1.0"
RDEPEND="${DEPEND}"

CONFIG_CHECK="~L2TP_V3 ~L2TP_IP ~L2TP_ETH"

PATCHES=( "${FILESDIR}"/${P}-makefile.patch )

pkg_setup() {
	linux-info_pkg_setup
	if kernel_is -lt 2 6 35; then
		eerror
		eerror "Your kernel is too old. At least 2.6.35 is required to work with this program."
		eerror
		die "kernel is too old"
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die "emake failed"
	dodoc README.txt
}

pkg_postinst() {
	einfo
	einfo If you have any of CONFIG_L2TP* options compiled as modules, please load
	einfo them before running l2tpv3tun.
	einfo
}
