# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

DESCRIPTION=" Interactive program which monitors squid logs and displays them in a nice fashion"
HOMEPAGE="http://www.rillion.net/squidview/"
SRC_URI="http://www.rillion.net/squidview/${P}.tar.gz"

KEYWORDS="x86"
SLOT="0"
LICENSE="GPL-2"
IUSE=""

DEPEND="net-proxy/squid
	sys-libs/ncurses"


src_install() {
        make DESTDIR=${D} install || die

	doman squidview.1
	dodoc AUTHORS ChangeLog COPYING NEWS README INSTALL
}
