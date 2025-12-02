# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit lua

DESCRIPTION="Lua bindings to libjwt using FFI"
HOMEPAGE="https://github.com/tsuru/lua-resty-libjwt"
SRC_URI="https://github.com/tsuru/lua-resty-libjwt/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	${LUA_DEPS}
	www-servers/nginx:*[nginx_modules_http_lua]
	>=dev-libs/libjwt-3.2.0
	>=dev-lua/lua-cjson-2.1.0[${LUA_USEDEP}]
"
DEPEND="
	${RDEPEND}
"

DOCS=( README.md )

each_lua_install() {
	insinto "$(lua_get_lmod_dir)"
	doins -r lib/resty
}

src_install() {
	lua_foreach_impl each_lua_install
	einstalldocs
}
