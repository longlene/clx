# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit lua git-r3

DESCRIPTION="Binding for GNU MP"
HOMEPAGE="https://github.com/Playemet/luajit-gmp"
SRC_URI=""
EGIT_REPO_URI="https://github.com/Playemet/luajit-gmp.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lang/luajit
"

src_install() {
	lua_install_module gmp.lua
}
