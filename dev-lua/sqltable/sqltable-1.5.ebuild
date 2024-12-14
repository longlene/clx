# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="SqlTable is a Lua module for accessing databases"
HOMEPAGE="https://zadzmo.org/code/sqltable/"
SRC_URI="https://zadzmo.org/code/sqltable/downloads/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}
	dev-lua/luadbi[${LUA_USEDEP}]
	dev-lua/coxpcall[${LUA_USEDEP}]
"

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r src/sqltable{,.lua}
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
