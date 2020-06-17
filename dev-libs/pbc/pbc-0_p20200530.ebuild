# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="6b694684ab9a8622f4486c7d988b900264567457"

DESCRIPTION="A protocol buffers library for C"
HOMEPAGE="https://github.com/cloudwu/pbc"
SRC_URI="https://github.com/cloudwu/pbc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
