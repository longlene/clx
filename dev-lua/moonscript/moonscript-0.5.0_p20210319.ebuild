# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua vcs-snapshot

EGIT_COMMIT="b7efcd131046ed921ae1075d7c0f6a3b64a570f7"

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
