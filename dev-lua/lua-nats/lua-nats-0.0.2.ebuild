# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit lua

DESCRIPTION="NATS Lua library"
HOMEPAGE="https://github.com/DawnAngel/lua-nats"
SRC_URI="https://github.com/DawnAngel/lua-nats/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-lua/luasocket
	dev-lua/lua-cjson
	dev-lua/uuid
"
RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	lua_install_module src/*.lua
	dodoc README.md
}
