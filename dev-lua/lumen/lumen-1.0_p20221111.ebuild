# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua vcs-snapshot

EGIT_COMMIT="e56e64c75ee92092cd087b633d5a173f01cde210"

DESCRIPTION="Lua Multitasking Environment"
HOMEPAGE="https://github.com/xopxe/lumen"
SRC_URI="https://github.com/xopxe/lumen/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

lua_src_install() {
	insinto $(lua_get_lmod_dir)/lumen
	doins -r init.lua sched.lua catalog.lua pipe.lua stream.lua mutex.lua log.lua lib tasks
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
