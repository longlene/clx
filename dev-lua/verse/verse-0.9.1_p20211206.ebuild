# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

EGIT_COMMIT="98dc175058"

DESCRIPTION="XMPP client library written in Lua"
HOMEPAGE="http://code.mathewwild.co.uk/"
SRC_URI="http://code.matthewwild.co.uk/verse/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	dev-lua/squish[${LUA_USEDEP}]
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
