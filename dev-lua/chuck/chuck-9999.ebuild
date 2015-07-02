# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit lua git-2

DESCRIPTION="High performance and easily use asynchronous network library for C/Lua"
HOMEPAGE="https://github.com/sniperHW/chuck"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/sniperHW/chuck.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="+luajit"

DEPEND="luajit? ( dev-lang/luajit )"
RDEPEND="${DEPEND}"

src_compile() {
	local mylua=""
	if use luajit ; then
		mylua=jit
	fi
	make LUA=${mylua} chuck
}

src_install() {
	lua_install_cmodule chuck.so
	dodoc README.md
}
