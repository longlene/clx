# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua

DESCRIPTION="MVC Web Framework for Lua"
HOMEPAGE="https://github.com/keplerproject/orbit"
SRC_URI="https://github.com/keplerproject/orbit/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/luafilesystem
	dev-lua/lpeg
	dev-lua/wsapi
	dev-lua/xavante
	dev-lua/cosmo
"

src_configure() {
	:
}

src_compile() {
	:
}

src_install() {
	lua_install_module -r src/orbit{,.lua}
	dobin src/launchers/orbit
	dodoc README
}
