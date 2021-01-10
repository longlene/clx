# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..3} luajit )

inherit lua

DESCRIPTION="CGILua is a tool for creating dynamic HTML pages and manipulating input data from Web forms"
HOMEPAGE="http://keplerproject.github.com/cgilua"
SRC_URI="https://github.com/keplerproject/cgilua/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}
	dev-lua/luafilesystem
"

DOCS=( doc README.md )

src_compile() { :; }

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r src/cgilua
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
