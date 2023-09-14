# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit lua git-r3

DESCRIPTION="Tiny lua module to write shell scripts with lua"
HOMEPAGE="https://github.com/zserge/luash"
SRC_URI=""

EGIT_REPO_URI="https://github.com/zserge/luash.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module sh.lua
	dodoc README.md
}
