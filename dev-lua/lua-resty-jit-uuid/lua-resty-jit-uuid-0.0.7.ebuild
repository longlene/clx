# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="Fast and dependency-free UUID library for LuaJIT/ngx_lua"
HOMEPAGE="https://github.com/thibaultcha/lua-resty-jit-uuid"
SRC_URI="https://github.com/thibaultcha/lua-resty-jit-uuid/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	:
}

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r lib/resty
}

src_install() {
	lua_foreach_impl lua_src_install
	dodoc README.md
}
