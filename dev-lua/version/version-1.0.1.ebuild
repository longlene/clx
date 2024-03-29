# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="Version comparison library"
HOMEPAGE="https://github.com/Kong/version.lua"
SRC_URI="https://github.com/Kong/version.lua/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}.lua-${PV}

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins src/version.lua
}

src_install() {
	lua_foreach_impl lua_src_install
	dodoc readme.md
}
