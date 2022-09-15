# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit flag-o-matic lua

DESCRIPTION="A Lua module to work with Google protobuf"
HOMEPAGE="https://github.com/starwing/lua-protobuf"
SRC_URI="https://github.com/starwing/lua-protobuf/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="
	${DEPEND}
	${LUA_DEPS}
"
BDEPEND=""

lua_src_compile() {
	$(tc-getCC) $(lua_get_CFLAGS) -fPIC -shared -o pb.so pb.c
}

src_compile() {
	lua_foreach_impl lua_src_compile
}

lua_src_install() {
	insinto $(lua_get_cmod_dir)
	doins pb.so
	insinto $(lua_get_lmod_dir)
	doins protoc.lua
}

src_install() {
	lua_foreach_impl lua_src_install
	dodoc README.md
}
