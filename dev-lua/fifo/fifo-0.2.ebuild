# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..3} luajit )

inherit lua vcs-snapshot

DESCRIPTION="Fifo library for Lua"
HOMEPAGE="https://github.com/daurnimator/fifo.lua"
SRC_URI="https://github.com/daurnimator/fifo.lua/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}"

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins fifo.lua
}

src_install() {
	lua_foreach_impl lua_src_install
}
