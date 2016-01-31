# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua

DESCRIPTION="Lua XML-RPC is a Lua package to access and provide XML-RPC services"
HOMEPAGE="https://github.com/timn/lua-xmlrpc"
SRC_URI="mirror://github/timn/lua-xmlrpc/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/luaexpat
dev-lua/luasocket
"

src_prepare() {
	mv src ${PN}
}

src_compile() {
	:
}

src_install() {
	lua_install_module -r ${PN}
	dodoc README
}
