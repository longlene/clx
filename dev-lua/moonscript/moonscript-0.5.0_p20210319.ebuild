# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..3} luajit )

inherit lua-single vcs-snapshot

EGIT_COMMIT="b7efcd131046ed921ae1075d7c0f6a3b64a570f7"

DESCRIPTION="A programmer friendly language that compiles into Lua."
HOMEPAGE="https://github.com/leafo/moonscript"
SRC_URI="https://github.com/leafo/moonscript/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="luajit +inotify"

RDEPEND="
	dev-lua/lpeg
	dev-lua/argparse
	dev-lua/luafilesystem
"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
"

src_install() {
	dobin bin/{moon,moonc}
	insinto $(lua_get_lmod_dir)
	doins -r moon moonscript
	dodoc README.md
}
