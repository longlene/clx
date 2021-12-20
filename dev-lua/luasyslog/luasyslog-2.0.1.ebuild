# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="Addon for lualogging to log to the system log"
HOMEPAGE="https://github.com/lunarmodules/luasyslog"
SRC_URI="https://github.com/lunarmodules/luasyslog/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-lua/lualogging-1.3.0
"
BDEPEND=""

lua_src_prepare() {
	sed -e "/CFLAGS/{s#-I \$(LUA_PREFIX)/include#$(lua_get_CFLAGS)#}" \
		-i Makefile
}

src_prepare() {
	default
	lua_foreach_impl lua_src_prepare
}

lua_src_compile() {
	emake
}

src_compile() {
	lua_foreach_impl lua_src_compile
}

lua_src_install() {
	insinto $(lua_get_cmod_dir)
	doins lsyslog.so
	insinto $(lua_get_lmod_dir)/logging
	doins syslog.lua
}

src_install() {
	lua_foreach_impl lua_src_install
	dodoc README.md
}
