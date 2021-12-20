# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="A LuaJIT implementation of xxhash"
HOMEPAGE="https://github.com/szensk/luaxxhash"
SRC_URI="https://github.com/szensk/luaxxhash/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins luaxxhash.lua
}

src_install() {
	lua_foreach_impl lua_src_install
	dodoc README.md
}
