# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua git-2

DESCRIPTION="Asynchronous TCP networking for Lua "
HOMEPAGE="https://github.com/rxi/async"
SRC_URI=""

EGIT_REPO_URI="https://github.com/rxi/async.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module async.lua
	dodoc README.md
}
