# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="A simple API to use logging features in Lua"
HOMEPAGE="https://github.com/lunarmodules/lualogging"
SRC_URI="https://github.com/lunarmodules/lualogging/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/luasocket
"
BDEPEND=""

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r src/logging
}

src_install() {
	lua_foreach_impl lua_src_install
	dodoc README.md
}
