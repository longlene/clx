# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit lua

DESCRIPTION="Templating Engine (HTML) for Lua and OpenResty"
HOMEPAGE="https://github.com/bungle/lua-resty-template"
SRC_URI="https://github.com/bungle/lua-resty-template/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="
	${DEPEND}
	${LUA_DEPS}
"
BDEPEND=""

src_compile() {
	:
}

each_src_install() {
	insinto "$(lua_get_lmod_dir)"
	doins -r lib/resty
}

src_install() {
	lua_foreach_impl each_src_install
	einstalldocs
}
