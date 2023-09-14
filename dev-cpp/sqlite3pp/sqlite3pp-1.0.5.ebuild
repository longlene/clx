# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="SQLite3++ - C++ wrapper of SQLite3 API"
HOMEPAGE="https://github.com/iwongu/sqlite3pp"
SRC_URI="https://github.com/iwongu/sqlite3pp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins headeronly_src/sqlite3pp{.h,.ipp,ext.h,ext.ipp}
	dodoc README.md
}
