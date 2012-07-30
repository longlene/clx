# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="small tool to exploit SQL injection vulnerabilities on a web
application that uses Microsoft SQL Server as its back-end"
HOMEPAGE="http://sqlninja.sourceforge.net"
SRC_URI="mirror://sourceforge/sqlninja/${P}.tgz"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""

src_install() {
	dobin sqlninja
	dodoc ChangeLog sqlninja.conf.example sqlninja-howto.html
}
