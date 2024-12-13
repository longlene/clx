# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="Lua bindings to libcmark CommonMark parser"
HOMEPAGE="https://github.com/jgm/cmark-lua"
SRC_URI="https://github.com/jgm/cmark-lua/archive/${PV}.tar.gz -> cmark-lua-${PV}.gh.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}"

S="${WORKDIR}/cmark-lua-${PV}"

lua_src_compile() {
	emake cmark.so
}

src_compile() {
	lua_foreach_impl lua_src_compile
}

lua_src_install() {
	insinto $(lua_get_cmod_dir)
	doins cmark.so
	insinto $(lua_get_lmod_dir)
	doins cmark
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
