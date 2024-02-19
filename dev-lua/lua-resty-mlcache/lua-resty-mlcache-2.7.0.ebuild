# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit lua

DESCRIPTION="Layered caching library for OpenResty"
HOMEPAGE="https://github.com/thibaultcha/lua-resty-mlcache"
SRC_URI="https://github.com/thibaultcha/lua-resty-mlcache/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="
	${LUA_DEPS}
	www-servers/nginx:*[nginx_modules_http_lua]
	dev-lua/lua-resty-lrucache[${LUA_USEDEP}]
	dev-lua/lua-resty-lock[${LUA_USEDEP}]
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
