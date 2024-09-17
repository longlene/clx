# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit lua

DESCRIPTION="Lua-land LRU Cache based on LuaJIT FFI"
HOMEPAGE="https://github.com/openresty/lua-resty-lrucache"
SRC_URI="https://github.com/openresty/lua-resty-lrucache/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

REQUIRED_USE="${LUA_REQUIRED_USE}"
DEPEND=""
RDEPEND="
	${DEPEND}
	${LUA_DEPS}
	www-servers/nginx:*[nginx_modules_http_lua]
"
BDEPEND=""

DOCS=( README.markdown )

each_lua_install() {
	insinto "$(lua_get_lmod_dir)"
	doins -r lib/resty
}

src_install() {
	lua_foreach_impl each_lua_install
	einstalldocs
}
