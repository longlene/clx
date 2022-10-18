# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="Copas is a dispatcher based on coroutines that can be used by TCP/IP servers"
HOMEPAGE="https://github.com/lunarmodules/copas"
SRC_URI="https://github.com/lunarmodules/copas/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	${LUA_DEPS}
	dev-lua/luasocket[${LUA_USEDEP}]
	dev-lua/coxpcall[${LUA_USEDEP}]
	dev-lua/binaryheap[${LUA_USEDEP}]
	dev-lua/timerwheel[${LUA_USEDEP}]
"

src_compile() {
	:
}

each_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r src/copas{,.lua}
}

src_install() {
	lua_foreach_impl each_src_install
	einstalldocs
}
