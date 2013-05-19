# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


DESCRIPTION="SQLBF is a tool to audit mssql passwords strength offline"
HOMEPAGE="http://www.cqure.net/tools.jsp?id=10"
SRC_URI="http://www.cqure.net/tools/${PN}-all-src-${PV}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""

S=${WORKDIR}/${PN}

src_install () {
	dobin bin/sqlbf
	dodoc README.wri
	docinto sample
	dodoc default.cm hashes.txt small.dic
}
