# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 lua

DESCRIPTION="A protocol buffers library for C"
HOMEPAGE="https://github.com/cloudwu/pbc"
SRC_URI=""

EGIT_REPO_URI="https://github.com/cloudwu/pbc.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="lua"

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake
	use lua && ( cd binding/lua && emake )
}

src_install() {
	dolib.a build/libpbc.a
	insinto /usr/include
	doins pbc.h
	if use lua ; then
		lua_install_module binding/lua/protobuf.lua
		lua_install_cmodule binding/lua/protobuf.so
	fi
	dodoc README.md
}
