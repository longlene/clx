# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit cmake lua

DESCRIPTION="Erlang External Term Format encoder and decoder for Lua"
HOMEPAGE="https://github.com/jprjr/lua-etf"
SRC_URI="https://github.com/jprjr/lua-etf/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/lua-${P}

src_prepare() {
	lua_foreach_impl cmake_src_prepare
}

src_configure() {
	lua_foreach_impl cmake_src_configure
}

src_compile() {
	lua_foreach_impl cmake_src_compile
}

lua_src_install() {
	insinto $(lua_get_cmod_dir)
	doins ${BUILD_DIR}/etf.so
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
