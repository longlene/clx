# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit lua vcs-snapshot

EGIT_COMMIT="17b604f7f7dd217557ca548fc1a9a0d373386480"

DESCRIPTION="LuaJIT FFI-based Random Library for OpenResty"
HOMEPAGE="https://github.com/bungle/lua-resty-random"
SRC_URI="https://github.com/bungle/lua-resty-random/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	${LUA_DEPS}
	www-servers/nginx:*[nginx_modules_http_lua,ssl]
	dev-libs/openssl:*
"

DOCS=(README.md)

each_lua_install() {
	insinto "$(lua_get_lmod_dir)"
	doins -r lib/resty
}

src_install() {
	lua_foreach_impl each_lua_install
	einstalldocs
}
