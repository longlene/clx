# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="Multipart Parser for Lua"
HOMEPAGE="https://github.com/Kong/lua-multipart"
SRC_URI="https://github.com/Kong/lua-multipart/archive/refs/tags/${PV}-1.tar.gz -> lua-${P}-1.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/lua-${P}-1

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins src/multipart.lua
}

src_install() {
	lua_foreach_impl lua_src_install
	dodoc README.md
}
