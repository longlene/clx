# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua

MY_PV=${PV}-1

DESCRIPTION="A OAuth client library for Lua"
HOMEPAGE="https://github.com/ignacio/LuaOAuth"
SRC_URI="mirror://github/ignacio/LuaOAuth/archive/${MY_PV}.tar.gz -> ${PN}-${MY_PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/luasocket
dev-lua/luasec
dev-lua/luacrypto
dev-lua/lbase64
"

S="${WORKDIR}"/LuaOAuth-${MY_PV}

src_compile() {
	:
}

src_install() {
	lua_install_module -r src/{OAuth.lua,OAuth}
	dodoc README.md
}
