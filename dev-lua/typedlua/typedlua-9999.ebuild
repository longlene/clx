# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua git-2

DESCRIPTION="An Optional Type System for Lua"
HOMEPAGE="https://github.com/andremm/typedlua"
SRC_URI=""

EGIT_REPO_URI="https://github.com/andremm/typedlua.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
>=dev-lua/lpeg-0.12
"

src_install() {
	lua_install_module -r typedlua
	dobin tlc
	dodoc README.md
}
