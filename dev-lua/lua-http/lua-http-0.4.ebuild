# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..3} luajit )

inherit lua

DESCRIPTION="HTTP Library for Lua"
HOMEPAGE="https://github.com/daurnimator/lua-http"
SRC_URI="https://github.com/daurnimator/lua-http/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}
	dev-lua/cqueues
	dev-lua/luaossl
	dev-lua/basexx
	dev-lua/lpeg
	dev-lua/lpeg_patterns
	dev-lua/binaryheap
	dev-lua/fifo
"

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r http
}

src_install() {
	lua_foreach_impl lua_src_install
}
