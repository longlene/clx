# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit lua git-2

DESCRIPTION="A LuaJIT-based interface to libclang"
HOMEPAGE="https://github.com/helixhorned/ljclang"
SRC_URI=""
EGIT_REPO_URI="https://github.com/helixhorned/ljclang.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="doc"

DEPEND="
sys-devel/clang
dev-lang/luajit
doc? ( app-text/asciidoc )
"
RDEPEND="${DEPEND}"

src_compile() {
	emake inc=$(llvm-config --includedir) || die "compile failed"
	use doc && emake asciidoc=asciidoc doc
}

src_install() {
	lua_install_cmodule libljclang_support.so
	lua_install_module ljclang.lua ljclang_Index_h.lua ljclang_cursor_kind.lua
	use doc && dohtml README.html
}


