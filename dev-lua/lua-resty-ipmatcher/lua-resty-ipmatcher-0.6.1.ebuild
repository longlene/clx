# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="High-performance match IP address for Nginx + Lua"
HOMEPAGE="https://github.com/api7/lua-resty-ipmatcher"
SRC_URI="https://github.com/api7/lua-resty-ipmatcher/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r resty
}

src_install() {
	lua_foreach_impl lua_src_install
	dodoc README.md
}
