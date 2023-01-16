# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="A Lua REPL implemented in Lua for embedding in other programs"
HOMEPAGE="https://github.com/hoelzro/lua-repl/"
SRC_URI="https://github.com/hoelzro/lua-repl/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	|| ( dev-lua/lua-linenoise[${LUA_USEDEP}] app-misc/rlwrap )
"

src_compile() {
	:
}

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r repl
}

src_install() {
	lua_foreach_impl lua_src_install
	newbin rep.lua ${PN}
	einstalldocs
}
