# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="SQL Parser for C++"
HOMEPAGE="https://github.com/hyrise/sql-parser"
SRC_URI="https://github.com/hyrise/sql-parser/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dolib.so libsqlparser.so
	insinto /usr/include/hsql
	doins src/*.h
	insinto /usr/include/hsql/parser
	doins src/parser/*.h
	insinto /usr/include/hsql/sql
	doins src/sql/*.h
	dodoc README.md
}
	
