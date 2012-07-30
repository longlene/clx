# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="SQLAT is a suite of tools which could be useful for pentesting a MS SQL Server"
HOMEPAGE="http://www.cqure.net/tools.jsp?id=6"
SRC_URI="http://www.cqure.net/tools/${PN}-src-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-db/freetds"

src_install () {
	mkdir -p "${D}"usr/bin
	make DESTDIR="${D}"usr install || die
	dodoc README
}
