# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="Healthcheck library for OpenResty to validate upstream service status"
HOMEPAGE="https://github.com/Kong/lua-resty-healthcheck"
SRC_URI="https://github.com/Kong/lua-resty-healthcheck/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/lua-resty-worker-events
	dev-lua/penlight
	dev-lua/lua-resty-timer
"
BDEPEND=""

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r lib/resty
}

src_install() {
	lua_foreach_impl lua_src_install
	dodoc README.md
}
