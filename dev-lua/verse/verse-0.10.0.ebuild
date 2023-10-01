# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="XMPP client library written in Lua"
HOMEPAGE="http://code.mathewwild.co.uk/"
SRC_URI="http://code.matthewwild.co.uk/verse/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

BDEPEND="
	dev-lua/squish[${LUA_USEDEP}]
"
RDEPEND="
	dev-lua/luasocket[${LUA_USEDEP}]
	dev-lua/luaexpat[${LUA_USEDEP}]
	dev-lua/luafilesystem[${LUA_USEDEP}]
	dev-lua/LuaBitOp[${LUA_USEDEP}]
"
DEPEND="${RDEPEND}"


lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins verse.lua
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
