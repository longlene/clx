# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2 lua

DESCRIPTION="Network access for Lua"
HOMEPAGE="https://github.com/mbalmer/luanet"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mbalmer/luanet.git"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_cmodule net.so
	dodoc README.md
}
