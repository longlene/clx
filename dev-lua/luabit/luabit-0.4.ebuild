# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua

DESCRIPTION="A bitwise operation lib totally written in Lua."
HOMEPAGE="http://luaforge.net/projects/bit/"
SRC_URI="http://luaforge.net/frs/download.php/2185/${P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-lang/lua"
RDEPEND="${DEPEND}
	app-arch/unzip"

src_compile() {
	:
}

src_install() {
	lua_install_module *.lua
}

