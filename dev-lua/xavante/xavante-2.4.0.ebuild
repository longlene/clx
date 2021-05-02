# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit lua

DESCRIPTION="Xavante is a Lua HTTP 1.1 Web server"
HOMEPAGE="https://github.com/keplerproject/xavante"
SRC_URI="https://github.com/keplerproject/xavante/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/luasocket
dev-lua/copas
dev-lua/luafilesystem
"

src_install() {
	lua_install_module -r src/{codeweb,sajax,webdav,xavante}
	dodoc README
}
