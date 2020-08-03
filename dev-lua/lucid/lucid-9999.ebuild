# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua git-r3

DESCRIPTION="Lua Web API Toolkit"
HOMEPAGE="https://github.com/akornatskyy/lucid"
#SRC_URI=""

EGIT_REPO_URI="https://github.com/akornatskyy/lucid.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	lua_install_module -r src/.
	dobin bin/lurl
	dodoc README.md
}
