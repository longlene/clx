# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit lua git-r3

DESCRIPTION="LZ4 library for LuaJIT"
HOMEPAGE="https://github.com/CheyiLin/ljlz4"
SRC_URI=""
EGIT_REPO_URI="https://github.com/CheyiLin/ljlz4.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lang/luajit
"

src_install() {
	lua_install_module lz4.lua
}
