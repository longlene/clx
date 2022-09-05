# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit lua vcs-snapshot

DESCRIPTION="Session library for OpenResty implementing Secure Cookie Protocol"
HOMEPAGE="https://github.com/bungle/lua-resty-session"
SRC_URI="https://github.com/bungle/lua-resty-session/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

REQUIRED_USE="${LUA_REQUIRED_USE}"

RDEPEND="
	${LUA_DEPS}
	www-servers/nginx:*[nginx_modules_http_lua]
	dev-lua/lua-cjson[${LUA_USEDEP}]
	dev-lua/resty-string[${LUA_USEDEP}]
"
DEPEND="
	${RDEPEND}
"

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
