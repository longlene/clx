# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..3} luajit )

inherit lua

DESCRIPTION="Feature-rich command line parser for Lua"
HOMEPAGE="https://github.com/mpeterv/argparse"
SRC_URI="https://github.com/luarocks/argparse/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

REQUIRED_USE="${LUA_REQUIRED_USE}"

RDEPEND="${LUA_DEPS}"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

DOCS=( README.md )

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins src/argparse.lua
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
