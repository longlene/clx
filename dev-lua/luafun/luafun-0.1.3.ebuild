# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua

DESCRIPTION="A high-performance functional programming library for LuaJIT"
HOMEPAGE="https://rtsisyk.github.com/luafun"
SRC_URI="https://github.com/luafun/luafun/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module fun.lua
	dodoc README.md
}
