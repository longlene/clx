# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua

DESCRIPTION="A high-performance functional programming library for LuaJIT"
HOMEPAGE="https://rtsisyk.github.com/luafun"
SRC_URI="https://github.com/rtsisyk/luafun/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module fun.lua
	dodoc README.md
}
