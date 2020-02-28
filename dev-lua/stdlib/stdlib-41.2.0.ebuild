# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua

DESCRIPTION="Lua library of modules for common programming tasks"
HOMEPAGE="http://luaforge.net/projects/stdlib/"
SRC_URI="http://luaforge.net/frs/download.php/3584/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
#KEYWORDS="~amd64"
IUSE="doc"

DEPEND="dev-lang/lua
	!dev-lua/getopt"
RDEPEND="${DEPEND}
	>=dev-lua/lrexlib-2.2.0"

S="${WORKDIR}/${PN}"

src_compile() {
	:
}

src_install() {
	lua_install_module modules/*.lua

	if use doc; then
		dohtml -r modules/* || die "dohtml failed"
	fi
}

