# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit lua git-r3

DESCRIPTION="A Lua bytecode compiler written in Lua itself"
HOMEPAGE="https://github.com/franko/luajit-lang-toolkit"
SRC_URI=""
EGIT_REPO_URI="https://github.com/franko/luajit-lang-toolkit.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="
dev-lang/luajit
"
RDEPEND="${DEPEND}"

src_install() {
	dobin src/luajit-x
	lua_install_module -r lang
	dodoc README.md
}
