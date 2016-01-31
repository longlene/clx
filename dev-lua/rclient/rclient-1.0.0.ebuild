# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit lua

DESCRIPTION="LuaJIT Client for Rserve"
HOMEPAGE="http://scilua.org/rclient.html"
SRC_URI="mirror://github/stepelu/lua-rclient/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lang/luajit
dev-lua/xsys
"

src_install() {
	insinto $(lua_get_sharedir)/rclient
	doins *.lua
}
