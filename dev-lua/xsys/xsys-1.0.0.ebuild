# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit lua

DESCRIPTION="LuaJIT General Purpose Routines"
HOMEPAGE="http://scilua.org/xsys.html"
SRC_URI="https://github.com/stepelu/lua-xsys/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lang/luajit
"

src_install() {
	insinto $(lua_get_sharedir)/xsys
	doins -r _dep *.lua
}
