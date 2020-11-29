# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua

DESCRIPTION="Lua bindings to getopt_long"
HOMEPAGE="http://luaforge.net/projects/alt-getopt"
SRC_URI="mirror://luaforge/${PN}/${PN}/${P}/lua-${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DOCS=( README )

S="${WORKDIR}/all/lua-${P}"
LUA_S="lua-alt-getopt"

each_lua_compile() { :; }

each_lua_install() {
	dolua alt_getopt.lua
}

all_lua_install() {
	dobin alt_getopt
}
