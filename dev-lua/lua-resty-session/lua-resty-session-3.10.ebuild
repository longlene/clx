# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit  lua

DESCRIPTION="Session library for OpenResty"
HOMEPAGE="https://github.com/bungle/lua-resty-session"
SRC_URI="https://github.com/bungle/lua-resty-session/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND=""
RDEPEND="
	${DEPEND}
	${LUA_DEPS}
	www-servers/nginx:*[nginx_modules_http_lua]
	dev-lua/lua-cjson[${LUA_USEDEP}]
	dev-lua/lua-resty-string[${LUA_USEDEP}]
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
