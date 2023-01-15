# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="Lua library to implement wrap logic in a circuit breaker"
HOMEPAGE="https://github.com/dream11/lua-circuit-breaker"
SRC_URI="https://github.com/dream11/lua-circuit-breaker/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}"
BDEPEND=""

lua_src_install() {
	insinto $(lua_get_lmod_dir)/${PN}
	doins src/*.lua
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
