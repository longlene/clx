# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua

DESCRIPTION="A Lua MVC Web Framework"
HOMEPAGE="http://sailorproject.org"
SRC_URI="https://github.com/Etiene/sailor/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/datafile
dev-lua/luafilesystem
dev-lua/valua
dev-lua/lbase64
dev-lua/cgilua
dev-lua/xavante
dev-lua/wsapi-xavante
dev-lua/busted
"

src_install() {
	lua_install_module -r src/{latclient.lua,latclient,remy.lua,remy,sailor.lua,sailor}
	dobin sailor
	dodoc README.md
}
