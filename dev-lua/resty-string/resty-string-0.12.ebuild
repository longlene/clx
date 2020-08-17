# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua

DESCRIPTION="String utilities and common hash functions for ngx_lua and LuaJIT"
HOMEPAGE="https://github.com/openresty/lua-resty-string"
SRC_URI="https://github.com/openresty/lua-resty-string/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="native-random"

RDEPEND="
	www-servers/nginx:*[nginx_modules_http_lua,ssl]
	dev-libs/openssl:0
"
DEPEND="
	${RDEPEND}
"
PDEPEND="!native-random? ( dev-lua/resty-random )"

DOCS=(README.markdown)

all_lua_prepare() {
	use native-random || rm lib/resty/random.lua
	lua_default
}

each_lua_install() {
	dolua_jit lib/resty
}
