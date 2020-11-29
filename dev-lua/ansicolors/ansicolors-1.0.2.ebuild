# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua

DESCRIPTION="ANSI terminal color manipulation for Lua"
HOMEPAGE="https://github.com/kikito/ansicolors.lua"
SRC_URI="https://github.com/kikito/ansicolors.lua/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}.lua-${PV}

DOCS=( README.textile )

each_lua_install() {
	dolua ansicolors.lua
}
