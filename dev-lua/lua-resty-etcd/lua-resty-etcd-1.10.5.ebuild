# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit lua

DESCRIPTION="Nonblocking Lua etcd driver library for OpenResty"
HOMEPAGE="https://github.com/api7/lua-resty-etcd"
SRC_URI="https://github.com/api7/lua-resty-etcd/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	${LUA_DEPS}
"
RDEPEND="
	${DEPEND}
	www-servers/nginx:*[nginx_modules_http_lua]
	dev-lua/api7-lua-resty-http[${LUA_USEDEP}]
	dev-lua/lua-typeof[${LUA_USEDEP}]
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
