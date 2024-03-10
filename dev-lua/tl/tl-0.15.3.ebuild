# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="The compiler for Teal"
HOMEPAGE="https://github.com/teal-language/tl"
SRC_URI="https://github.com/teal-language/tl/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-lua/argparse-0.7.1[${LUA_USEDEP}]
	>=dev-lua/luafilesystem-1.8.0[${LUA_USEDEP}]
"
BDEPEND=""

src_compile() {
	:
}

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins tl.lua
}

src_install() {
	lua_foreach_impl lua_src_install
	dobin tl
	einstalldocs
}
