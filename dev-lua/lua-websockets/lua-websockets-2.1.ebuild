# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua

DESCRIPTION="Websockets for Lua"
HOMEPAGE="https://github.com/lipp.github.com/lua-websockets/"
SRC_URI="https://github.com/lipp/lua-websockets/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/struct
dev-lua/luasocket
dev-lua/LuaBitOp
dev-lua/copas
"

src_install() {
	lua_install_module -r src/*
	dodoc README.md
}
