# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit lua vcs-snapshot

EGIT_COMMIT="293348b5aef029b8ca29269f96c8a8fe9bde33ce"

DESCRIPTION="An async framework for Lua/Torch"
HOMEPAGE="https://github.com/clementfarabet/async"
SRC_URI="https://github.com/clementfarabet/async/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/lua-cjson[${LUA_USEDEP}]
	sci-libs/torch7[${LUA_USEDEP}]
"

#DOCS=( README.md )

src_prepare() {
	default
	sed -e '/luaL_newlib/d' \
		-i lhttp_parser/lhttp_parser.h
	sed -e '/luaL_newlib/d' \
		-i luv/src/common.h
	sed -e 's# -Werror##' \
		-i	lhttp_parser/Makefile
	sed -e 's# -Werror##' \
		-i	lhttp_parser/http-parser/Makefile
}

lua_src_compile() {
	LUA_INCDIR=$(lua_get_include_dir) emake
}

src_compile() {
	lua_foreach_impl lua_src_compile
}

each_lua_install() {
	insinto $(lua_get_lmod_dir)
	doins -r async
	insinto $(lua_get_cmod_dir)
	doins luv/luv.so lhttp_parser/lhttp_parser.so
}

src_install() {
	lua_foreach_impl each_lua_install
	einstalldocs
}
