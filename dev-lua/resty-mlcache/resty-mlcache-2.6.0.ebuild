# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit lua vcs-snapshot

DESCRIPTION="Layered caching library for OpenResty"
HOMEPAGE="https://github.com/thibaultcha/lua-resty-mlcache"
SRC_URI="https://github.com/thibaultcha/lua-resty-mlcache/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	${LUA_DEPS}
	www-servers/nginx:*[nginx_modules_http_lua]
	dev-lua/resty-lrucache[${LUA_USEDEP}]
	dev-lua/resty-lock[${LUA_USEDEP}]
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
