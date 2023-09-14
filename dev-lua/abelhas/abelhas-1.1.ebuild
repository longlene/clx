# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..3} luajit )

inherit lua vcs-snapshot

DESCRIPTION="A particle swarm optimization library for Lua"
HOMEPAGE="http://ittner.github.com/abelhas"
SRC_URI="https://github.com/ittner/abelhas/archive/abelhas-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README luapso.ps )

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins pso.lua
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
