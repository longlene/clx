# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="Adaptive Radix Trees implemented in Lua / LuaJIT"
HOMEPAGE="https://github.com/api7/lua-resty-radixtree"
SRC_URI="https://github.com/api7/lua-resty-radixtree/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND=""
RDEPEND="${DEPEND}
	${LUA_DEPS}
	www-servers/nginx:*[nginx_modules_http_lua]
	dev-lua/lua-resty-ipmatcher[${LUA_USEDEP}]
	>=dev-lua/lua-resty-expr-1.3.0[${LUA_USEDEP}]
"
BDEPEND=""

DOCS=( README.md )

src_compile() {
	:
}

each_lua_install() {
	insinto "$(lua_get_lmod_dir)"
	doins -r lib/resty
}

src_install() {
	lua_foreach_impl each_lua_install
	einstalldocs
}
