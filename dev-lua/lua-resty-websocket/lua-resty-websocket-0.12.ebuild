# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit lua

DESCRIPTION="WebSocket support for the ngx_lua module"
HOMEPAGE="https://github.com/openresty/lua-resty-websocket"
SRC_URI="https://github.com/openresty/lua-resty-websocket/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="
	${DEPEND}
	${LUA_DEPS}
	www-servers/nginx:*[nginx_modules_http_lua]
"
BDEPEND=""

DOCS=(README.markdown)

each_lua_install() {
	insinto "$(lua_get_lmod_dir)"
	doins -r lib/resty
}

src_install() {
	lua_foreach_impl each_lua_install
	einstalldocs
}
