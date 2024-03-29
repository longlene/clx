# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit lua

DESCRIPTION="LuaJIT SQLite Binding"
HOMEPAGE="http://scilua.org/ljsqlite3.html"
SRC_URI="https://github.com/stepelu/lua-ljsqlite3/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lang/luajit
dev-db/sqlite:3
"

src_install() {
	insinto $(lua_get_sharedir)/ljsqlite3
	doins *.lua
	dodoc README.md
}
