# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit  lua

DESCRIPTION="A light markup language"
HOMEPAGE="https://djot.net"
SRC_URI="https://github.com/jgm/djot.lua/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/djot.lua-${PV}

src_prepare() {
	default
	sed -e '1 i#!/usr/bin/env lua' \
		-i bin/main.lua
}

src_compile() {
	:
}

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r djot{,.lua}
}

src_install() {
	lua_foreach_impl lua_src_install
	newbin bin/main.lua djot
	doman doc/djot.1
	einstalldocs
}

