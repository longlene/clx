# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit lua

DESCRIPTION="Tiny C Compiler binding for LuaJIT. "
HOMEPAGE="https://github.com/Playermet/luajit-tcc"
SRC_URI="https://github.com/Playermet/luajit-tcc/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lang/tcc
dev-lang/luajit
"

src_install() {
	lua_install_module tcc.lua
}
