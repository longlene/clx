# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="Lua implementation of ACMEv2 procotol"
HOMEPAGE="https://github.com/Kong/lua-resty-dns-client"
SRC_URI="https://github.com/Kong/lua-resty-dns-client/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/penlight
	dev-lua/lrandom
	dev-lua/lua-resty-timer
	dev-lua/binaryheap
	dev-lua/luaxxhash
"
BDEPEND=""

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r src/resty
}

src_install() {
	lua_foreach_impl lua_src_install
	dodoc README.md
}
