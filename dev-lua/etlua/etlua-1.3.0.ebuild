# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="Embedded Lua templates"
HOMEPAGE="https://github.com/leafo/etlua"
SRC_URI="https://github.com/leafo/etlua/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	:
}

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins etlua.lua
}

src_install() {
	lua_foreach_impl lua_src_install
	dodoc README.md
}
