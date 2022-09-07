# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..4} )

inherit lua-single

DESCRIPTION="Build a standalone executable from a Lua program"
HOMEPAGE="https://github.com/ers35/luastatic"
SRC_URI="https://github.com/ers35/luastatic/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

DOCS=( readme.md )

src_compile() {
	emake LUA=${ELUA} LIBLUA_A=$(lua_get_LIBS)
}

src_test() {
	emake run_test LUA=${ELUA} LIBLUA_A=$(lua_get_LIBS)
}

src_install() {
	dobin luastatic
	einstalldocs
}
