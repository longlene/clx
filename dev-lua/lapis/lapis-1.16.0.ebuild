# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="A web framework for Lua/MoonScript"
HOMEPAGE="https://github.com/leafo/lapis"
SRC_URI="https://github.com/leafo/lapis/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}
	dev-lua/ansicolors[${LUA_USEDEP}]
	dev-lua/date[${LUA_USEDEP}]
	dev-lua/etlua[${LUA_USEDEP}]
	dev-lua/loadkit[${LUA_USEDEP}]
	dev-lua/lpeg[${LUA_USEDEP}]
	dev-lua/lua-cjson[${LUA_USEDEP}]
	dev-lua/luaossl[${LUA_USEDEP}]
	dev-lua/luafilesystem[${LUA_USEDEP}]
	dev-lua/luasocket[${LUA_USEDEP}]
	dev-lua/pgmoon[${LUA_USEDEP}]
"
BDEPEND="virtual/pkgconfig"

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r lapis
}

src_install() {
	lua_foreach_impl lua_src_install
	dobin bin/lapis
	dodoc README.md
}
