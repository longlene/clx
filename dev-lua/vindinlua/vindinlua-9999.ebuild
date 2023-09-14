# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3 lua

DESCRIPTION="A Vindinium starter kit for Lua"
HOMEPAGE="https://github.com/mtdowling/vindinlua"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mtdowling/vindinlua.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/dkjson
	dev-lua/luasocket
"

src_install() {
	lua_install_module ${PN}.lua
	dodoc README.rst
}
