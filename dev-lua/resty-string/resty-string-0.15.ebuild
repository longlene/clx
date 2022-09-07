# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( luajit )

inherit lua vcs-snapshot

DESCRIPTION="String utilities and common hash functions for ngx_lua and LuaJIT"
HOMEPAGE="https://github.com/openresty/lua-resty-string"
SRC_URI="https://github.com/openresty/lua-resty-string/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="native-random"

REQUIRED_USE="${LUA_REQUIRED_USE}"
RDEPEND="
	${LUA_DEPS}
	www-servers/nginx:*[nginx_modules_http_lua,ssl]
	dev-libs/openssl:0
	!native-random? ( dev-lua/resty-random[${LUA_USEDEP}] )
"
DEPEND="
	${RDEPEND}
"

DOCS=(README.markdown)

src_prepare() {
	default
	use native-random || rm lib/resty/random.lua
}

each_lua_install() {
	insinto "$(lua_get_lmod_dir)"
	doins -r lib/resty
}

src_install() {
	lua_foreach_impl each_lua_install
	einstalldocs
}
