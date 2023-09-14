# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="Date & Time module for Lua"
HOMEPAGE="http://tieske.github.io/date/"
SRC_URI="https://github.com/Tieske/date/archive/version_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

S=${WORKDIR}/${PN}-version_${PV}

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins src/date.lua
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
