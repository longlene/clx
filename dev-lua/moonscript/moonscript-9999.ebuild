# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from Lua overlay; Bumped by mva; $

EAPI="5"

inherit base toolchain-funcs git-r3

DESCRIPTION="A programmer friendly language that compiles into Lua."
HOMEPAGE="https://github.com/leafo/moonscript"
SRC_URI=""

EGIT_REPO_URI="https://github.com/leafo/moonscript"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="luajit +inotify"

RDEPEND="
	!luajit? ( >=dev-lang/lua-5.1 )
	luajit?  ( dev-lang/luajit:2 )
	dev-lua/lpeg
	dev-lua/luafilesystem
	dev-lua/alt-getopt
	inotify? ( dev-lua/linotify )
"
DEPEND="
	${RDEPEND}
	dev-util/pkgconfig
"

HTML_DOCS=( "docs/" "README.md" )

src_compile() {
	emake compile
}

src_install() {
	local lua=lua;
	use luajit && lua=luajit;

	insinto "$($(tc-getPKG_CONFIG) --variable INSTALL_LMOD ${lua})"
	doins -r moon.lua moonscript.lua moon moonscript

	dobin bin/moon bin/moonc

	base_src_install_docs
}