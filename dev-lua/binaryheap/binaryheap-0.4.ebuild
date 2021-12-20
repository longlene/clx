# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

MY_PV=${PV/./v}

DESCRIPTION="Binary heap implementation in Lua"
HOMEPAGE="https://github.com/Tieske/binaryheap.lua"
SRC_URI="https://github.com/Tieske/binaryheap.lua/archive/refs/tags/version_${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}.lua-version_${MY_PV}

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins src/binaryheap.lua
}

src_install() {
	lua_foreach_impl lua_src_install
	dodoc README.md
}
