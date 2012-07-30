DESCRIPTION="cross-platform RRCP-based toolset"
HOMEPAGE="http://openrrcp.org.ru"
SRC_URI="http://openrrcp.org.ru/download/preview/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="x86"

src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_compile() {
  emake || die "emake failed"
}

src_install() {
	dosbin bin/rrcp_cli bin/rtl83xx
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl8316b
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl8326
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl83xx_compex_ps2216
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl83xx_dlink_des1016d
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl83xx_dlink_des1024d
	dosym /usr/sbin/rtl83xx /usr/sbin/rtl83xx_ovislink_fsh2402gt
	dodoc ChangeLog LICENSE config-example/des1016d.config.txt
}
