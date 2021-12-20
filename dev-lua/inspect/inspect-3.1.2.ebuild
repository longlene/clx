# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="Human-readable representation of Lua tables"
HOMEPAGE="https://github.com/kikito/inspect.lua"
SRC_URI="https://github.com/kikito/inspect.lua/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}.lua-${PV}

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins inspect.lua
}

src_install() {
	lua_foreach_impl lua_src_install
	dodoc README.md
}
