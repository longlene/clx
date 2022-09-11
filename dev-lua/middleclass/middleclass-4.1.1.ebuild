# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="Object-orientation for Lua"
HOMEPAGE="https://github.com/kikito/middleclass"
SRC_URI="https://github.com/kikito/middleclass/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="
	${LUA_DEPS}
	${DEPEND}
"

DOCS=( README.md )

each_src_install() {
	insinto "$(lua_get_lmod_dir)"
	doins middleclass.lua
}

src_install() {
	lua_foreach_impl each_src_install
	einstalldocs
}
