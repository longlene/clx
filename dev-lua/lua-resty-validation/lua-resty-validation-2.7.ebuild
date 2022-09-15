# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=(  luajit )

inherit lua

DESCRIPTION="Validation Library (Input Validation and Filtering) for Lua and OpenResty"
HOMEPAGE="https://github.com/bungle/lua-resty-validation"
SRC_URI="https://github.com/bungle/lua-resty-validation/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="
	${DEPEND}
	${LUA_DEPS}
"
BDEPEND=""

each_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r lib/resty
}

src_install() {
	lua_foreach_impl each_src_install
	einstalldocs
}
