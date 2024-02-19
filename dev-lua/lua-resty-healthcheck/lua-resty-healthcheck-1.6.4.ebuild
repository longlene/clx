# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit lua

DESCRIPTION="Healthcheck library for OpenResty to validate upstream service status"
HOMEPAGE="https://github.com/Kong/lua-resty-healthcheck"
SRC_URI="https://github.com/Kong/lua-resty-healthcheck/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	${LUA_DEPS}
	dev-lua/lua-resty-worker-events[${LUA_USEDEP}]
	www-servers/nginx:*[nginx_modules_http_lua,nginx_modules_http_lua_upstream]
	dev-lua/penlight[${LUA_USEDEP}]
	dev-lua/lua-resty-timer[${LUA_USEDEP}]
"
BDEPEND=""

DOCS=( readme.md )

each_lua_install() {
	insinto "$(lua_get_lmod_dir)"
	doins -r lib/resty
}

src_install() {
	lua_foreach_impl each_lua_install
	einstalldocs
}
