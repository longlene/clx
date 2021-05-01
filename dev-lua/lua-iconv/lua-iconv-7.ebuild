# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua

DESCRIPTION="Lua bindings for POSIX iconv"
HOMEPAGE="http://ittner.github.com/lua-iconv"
SRC_URI="https://github.com/ittner/lua-iconv/archive/${P}.tar.gz -> ${P}.tar.gz"

EGIT_REPO_URI="git://github.com/ittner/lua-iconv.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="|| ( >=dev-lang/lua-5.1 dev-lang/luajit:2 )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

S="${WORKDIR}"/${PN}-${P}

src_prepare() {
	sed -e "s#LUAPKG = lua5.2#LUAPKG = lua#" -i Makefile
}

src_install() {
	lua_install_cmodule iconv.so
	dodoc README
}
