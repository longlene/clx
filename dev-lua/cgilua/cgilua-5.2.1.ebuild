# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit lua

DESCRIPTION="CGILua is a tool for creating dynamic HTML pages and manipulating input data from Web forms"
HOMEPAGE="http://keplerproject.github.com/cgilua"
SRC_URI="https://github.com/keplerproject/cgilua/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/luafilesystem
"

src_prepare() {
	mv src/cgilua/cgilua.lua src
}

src_install() {
	lua_install_module -r src/cgilua*
}
