# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit lua

DESCRIPTION="Manipulation of Dates and Periods in LuaJIT"
HOMEPAGE="http://scilua.org/time.html"
SRC_URI="https://github.com/stepelu/lua-time/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lang/luajit
"

src_install() {
	insinto $(lua_get_sharedir)/time
	doins *.lua
}


