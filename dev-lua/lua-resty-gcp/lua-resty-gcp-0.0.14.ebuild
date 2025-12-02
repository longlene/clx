# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="GCP SDK for OpenResty"
HOMEPAGE="https://github.com/Kong/lua-resty-gcp"
SRC_URI="https://github.com/Kong/lua-resty-gcp/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND=""
RDEPEND="${DEPEND}
	${LUA_DEPS}
	www-servers/nginx:*[nginx_modules_http_lua]
	>=dev-lua/lua-resty-jwt-0.2.3[${LUA_USEDEP}]
	dev-lua/lua-resty-luasocket[${LUA_USEDEP}]
"
BDEPEND=""

DOCS=( README.md )

src_compile() {
	:
}

each_lua_install() {
	insinto "$(lua_get_lmod_dir)"
	doins -r src/resty
}

src_install() {
	lua_foreach_impl each_lua_install
	einstalldocs
}
