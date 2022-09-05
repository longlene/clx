# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit lua vcs-snapshot

DESCRIPTION="Lua kafka client driver for the OpenResty based on the cosocket API"
HOMEPAGE="https://github.com/Kong/lua-resty-kafka"
SRC_URI="https://github.com/Kong/lua-resty-kafka/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

REQUIRED_USE="${LUA_REQUIRED_USE}"

RDEPEND="
	${LUA_DEPS}
	www-servers/nginx:*[nginx_modules_http_lua]
	dev-lua/resty-openssl[${LUA_USEDEP}]
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
