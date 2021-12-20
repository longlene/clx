# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="System Constants"
HOMEPAGE="https://github.com/Kong/lua-system-constants"
SRC_URI="https://github.com/Kong/lua-system-constants/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

lua_src_compile() {
	LUA=${ELUA} emake
}

src_compile() {
	lua_foreach_impl lua_src_compile
}

lua_src_install() {
	insinto $(lua_get_cmod_dir)
	doins lua_system_constants.so
}

src_install() {
	lua_foreach_impl lua_src_install
	dodoc README.md
}
