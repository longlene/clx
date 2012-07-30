# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-wireless/aircrack-ng/aircrack-ng-0.7-r2.ebuild,v 1.2 2007/04/13 21:22:03 armin76 Exp $

inherit toolchain-funcs eutils

DESCRIPTION="WLAN tools for attacking wep-clients"
HOMEPAGE="http://www.ptsecurity.ru/wepoff.asp"
SRC_URI="http://www.ptsecurity.ru/download/wepoff.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""

src_compile() {
	cd ${WORKDIR}/wep0ff
	gcc -o wep0ff wep0ff.c
}

src_install() {
	cd ${WORKDIR}/wep0ff
	dobin wep0ff
	dodoc README
}

