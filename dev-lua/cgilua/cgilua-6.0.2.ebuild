# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua

DESCRIPTION="CGILua is a tool for creating dynamic HTML pages and manipulating input data from Web forms"
HOMEPAGE="http://keplerproject.github.com/cgilua"
SRC_URI="https://github.com/keplerproject/cgilua/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/luafilesystem
"

DOCS=( doc README.md )

each_lua_install() {
	dolua src/cgilua
}
