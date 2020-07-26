# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 lua

DESCRIPTION="nanomsg for lua"
HOMEPAGE="https://github.com/arcapos/luananomsg"
SRC_URI=""

EGIT_REPO_URI="https://github.com/arcapos/luananomsg.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="
	dev-libs/nanomsg
"
RDEPEND="${DEPEND}"

src_install() {
	lua_install_cmodule nanomsg.so
	dodoc README
}
