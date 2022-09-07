# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="Pure Lua CBOR implementation"
HOMEPAGE="https://www.zash.se/lua-cbor.html"
SRC_URI="https://code.zash.se/lua-cbor/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

REQUIRED_USE="${LUA_REQUIRED_USE}"
DEPEND=""
RDEPEND="
	${DEPEND}
	${LUA_DEPS}
"
BDEPEND=""

DOCS=( README.markdown )

each_src_install() {
	insinto "$(lua_get_lmod_dir)"
	doins cbor.lua cbor.bignum.lua
}

src_install() {
	lua_foreach_impl each_src_install
	einstalldocs
}
