# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from Lua overlay; Bumped by mva; $

EAPI="5"

inherit lua

MY_PV=${PV//./_}

DESCRIPTION="Lua coxpcall Library"
HOMEPAGE="https://github.com/keplerproject/coxpcall"
SRC_URI="mirror://github/keplerproject/coxpcall/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=" || ( >=dev-lang/lua-5.1 dev-lang/luajit:2 )"
DEPEND="${RDEPEND}"

S="${WORKDIR}"/${PN}-${MY_PV}

src_configure() {
	:
}

src_compile() {
	:
}

src_install() {
	lua_install_module src/coxpcall.lua
}
