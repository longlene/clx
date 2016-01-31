# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua

DESCRIPTION="Lexing & Syntax Highlighting in Lua"
HOMEPAGE="http://peterodding.com/code/lua/lxsh/"
SRC_URI="mirror://github/xolox/lua-lxsh/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
>=dev-lua/lpeg-0.9
"

src_compile() {
	:
}

src_install() {
	mv src lxsh
	lua_install_module -r lxsh
	dodoc README.md
}
