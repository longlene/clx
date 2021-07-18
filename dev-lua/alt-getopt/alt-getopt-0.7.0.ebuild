# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="Lua bindings to getopt_long"
HOMEPAGE="http://luaforge.net/projects/alt-getopt"
SRC_URI="mirror://luaforge/${PN}/${PN}/${P}/lua-${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

DOCS=( README )

S="${WORKDIR}/lua-${P}"

src_compile() { :; }

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins alt_getopt.lua
}

src_install() {
	lua_foreach_impl lua_src_install

	einstalldocs
}
