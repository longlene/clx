# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( luajit )

inherit lua

DESCRIPTION="New LuaJIT FFI based API for lua-nginx-module"
HOMEPAGE="https://github.com/openresty/lua-resty-core"
SRC_URI="https://github.com/openresty/lua-resty-core/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${LUA_REUIRED_USE}"
RDEPEND="
	${LUA_DEPS}
	www-servers/nginx:*[nginx_modules_http_lua]
	dev-lua/lua-resty-lrucache[${LUA_USEDEP}]
"
DEPEND="
	${RDEPEND}
"

DOCS=( docs/. )

src_prepare() {
	default
	mkdir docs
	find . -type f -name '*.md' -exec mv -t docs {} ';'
}

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r lib/resty lib/ngx
}

src_install() {
	einstalldocs
	lua_foreach_impl lua_src_install
}
