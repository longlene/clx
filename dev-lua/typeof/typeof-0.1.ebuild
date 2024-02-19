# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="Check the data type for Lua variable"
HOMEPAGE="https://github.com/iresty/lua-typeof"
SRC_URI="https://github.com/iresty/lua-typeof/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="
	${DEPEND}
	${LUA_DEPS}
"
BDEPEND=""

DOCS=( README.md )

S="${WORKDIR}"/lua-${P}

each_lua_install() {
	insinto "$(lua_get_lmod_dir)"
	doins lib/typeof.lua
}

src_install() {
	lua_foreach_impl each_lua_install
	einstalldocs
}
