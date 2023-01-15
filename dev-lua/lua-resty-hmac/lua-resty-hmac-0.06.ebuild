# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit lua

DESCRIPTION="HMAC functions for ngx_lua and LuaJIT"
HOMEPAGE="https://github.com/jkeys089/lua-resty-hmac"
SRC_URI="https://github.com/jkeys089/lua-resty-hmac/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="
	${LUA_DEPS}
	www-servers/nginx:*[nginx_modules_http_lua]
"
BDEPEND=""

DOCS=( README.md )

each_lua_install() {
	insinto "$(lua_get_lmod_dir)"
	doins -r lib/resty
}

src_install() {
	lua_foreach_impl each_lua_install
	einstalldocs
}
