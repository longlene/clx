# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit lua vcs-snapshot

DESCRIPTION="AWS SDK for OpenResty"
HOMEPAGE="https://github.com/Kong/lua-resty-aws"
SRC_URI="https://github.com/Kong/lua-resty-aws/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

REQUIRED_USE="${LUA_REQUIRED_USE}"

RDEPEND="
	${LUA_DEPS}
	www-servers/nginx:*[nginx_modules_http_lua]
	dev-lua/penlight[${LUA_USEDEP}]
	dev-lua/resty-http[${LUA_USEDEP}]
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
	doins -r src/resty
}

src_install() {
	lua_foreach_impl each_lua_install
	einstalldocs
}
