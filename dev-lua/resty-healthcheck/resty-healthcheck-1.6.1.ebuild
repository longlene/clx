# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit lua vcs-snapshot

DESCRIPTION="Health Checker for Nginx Upstream Servers in Pure Lua"
HOMEPAGE="https://github.com/openresty/lua-resty-upstream-healthcheck"
SRC_URI="https://github.com/Kong/lua-resty-healthcheck/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	${LUA_DEPS}
	www-servers/nginx:*[nginx_modules_http_lua,nginx_modules_http_lua_upstream]
	dev-lua/resty-worker-events[${LUA_USEDEP}]
	dev-lua/penlight[${LUA_USEDEP}]
	dev-lua/resty-timer[${LUA_USEDEP}]
"
DEPEND="
	${RDEPEND}
"

DOCS=( readme.md )

each_lua_install() {
	insinto "$(lua_get_lmod_dir)"
	doins -r lib/resty
}

src_install() {
	lua_foreach_impl each_lua_install
	einstalldocs
}
