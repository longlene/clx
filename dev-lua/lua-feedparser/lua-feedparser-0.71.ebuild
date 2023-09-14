# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit lua

DESCRIPTION="A decent RSS and Atom XML feed parser"
HOMEPAGE="http://feedparser.luaforge.net/"
SRC_URI="https://github.com/slact/lua-feedparser/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lang/luaexpat
"

src_compile() {
	:
}

src_install() {
	lua_install_module -r feedparser.lua feedparser
	dodoc README
}
