# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="Helper module to check the function arguments"
HOMEPAGE="https://github.com/mah0x211/lua-argexpected"
SRC_URI="https://github.com/mah0x211/lua-argexpected/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/string-format[${LUA_USEDEP}]
"
BDEPEND=""

S="${WORKDIR}"/lua-${P}

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins argexpected.lua
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
