# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="A Lua module using LuaJIT's FFI feature to access zlib"
HOMEPAGE="https://github.com/hamishforbes/lua-ffi-zlib"
SRC_URI="https://github.com/hamishforbes/lua-ffi-zlib/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins lib/ffi-zlib.lua
}

src_install() {
	lua_foreach_impl lua_src_install
	dodoc README.md
}
