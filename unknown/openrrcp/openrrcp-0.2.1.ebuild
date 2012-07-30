# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Cross-platform RRCP-based toolset"
HOMEPAGE="http://openrrcp.org.ru"
SRC_URI="http://sourceforge.net/projects/openrrcp/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	dosbin bin/rrcpcli bin/rtl83xx
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl8316b
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl8324
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl8326
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl83xx_compex_ps2216
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl83xx_dlink_des1016d
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl83xx_dlink_des1024d
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl83xx_dlink_des1024d_b1
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl83xx_dlink_des1024d_c1
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl83xx_compex_ps2216_6d
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl83xx_compex_ps2216_6dp
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl83xx_zyxel_es116p
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl83xx_compex_sds1224
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl83xx_asus_gigax_1024p
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl83xx_signamax_065-7531a
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl83xx_repotec_g3224x
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl83xx_edimax_es-3116p
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl83xx_ovislink_fsh2402gt
	dodoc ChangeLog LICENSE config-example/des1016d.config.txt
}
