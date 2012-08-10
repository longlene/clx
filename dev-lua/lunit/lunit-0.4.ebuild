# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit lua

DESCRIPTION="A unit testing framework for Lua"
HOMEPAGE="http://www.mroth.net/lunit/"
SRC_URI="http://www.mroth.net/${PN}/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-lang/lua-5.1"
RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	lua_install_module lunit.lua lunit-console.lua
	dobin lunit || die "dobin failed"
	dodoc ANNOUNCE CHANGES DOCUMENTATION README* example.lua || die "dodoc failed"
}

src_test() {
	./lunit lunit-tests.lua || die "tests failed"
}
