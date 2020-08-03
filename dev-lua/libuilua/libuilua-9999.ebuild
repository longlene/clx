# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 lua

DESCRIPTION="Lua binding for libui"
HOMEPAGE="https://github.com/zevv/libuilua"
SRC_URI=""

EGIT_REPO_URI="https://github.com/zevv/libuilua.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="x11-libs/libui"
RDEPEND="${DEPEND}"

src_install() {
	lua_install_cmodule libuilua.so
	dodoc README.md
}
