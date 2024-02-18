# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua vcs-snapshot

EGIT_COMMIT="d5341c9093c49d3724072b209cde28b5cb0f47c9"

DESCRIPTION="A programmer friendly language that compiles into Lua."
HOMEPAGE="https://moonscript.org"
SRC_URI="https://github.com/leafo/moonscript/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="luajit +inotify"

RDEPEND="
	${LUA_DEPS}
	dev-lua/lpeg[${LUA_USEDEP}]
	dev-lua/argparse[${LUA_USEDEP}]
	dev-lua/luafilesystem[${LUA_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
"

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r moon moonscript
}
src_install() {
	lua_foreach_impl lua_src_install
	dobin bin/{moon,moonc}
	dodoc README.md
}
