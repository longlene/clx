# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="ANSI terminal color manipulation for Lua"
HOMEPAGE="https://github.com/kikito/ansicolors.lua"
SRC_URI="https://github.com/kikito/ansicolors.lua/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

REQUIRED_USE="${LUA_REQUIRED_USE}"

RDEPEND="${LUA_DEPS}"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

S="${WORKDIR}"/${PN}.lua-${PV}

DOCS=( README.textile )

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins ansicolors.lua
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
