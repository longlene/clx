# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua git-r3

DESCRIPTION="FreeImage Luajit binding"
HOMEPAGE="https://github.com/nyfair/fi-luajit"
SRC_URI=""

EGIT_REPO_URI="https://github.com/nyfair/fi-luajit.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
media-libs/freeimage
"

src_install() {
	lua_install_module fi.lua fsposix.lua
	dodoc readme.md
}
