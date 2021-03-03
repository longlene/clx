# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..3} luajit )

inherit lua vcs-snapshot

EGIT_COMMIT="65f2d3d61b9b13bdc380afc2eaf0c7c6ef461be7"

DESCRIPTION="A Lua REPL and debugger"
HOMEPAGE="https://github.com/giann/croissant"
SRC_URI="https://github.com/giann/croissant/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-lua/sirocco-0.0.1
	>=dev-lua/hump-0.4
	>=dev-lua/lpeg-1.0.1
	>=dev-lua/argparse-0.6.0
"
BDEPEND=""

DOCS=( READM.md )

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r croissant
}

src_install() {
	lua_foreach_impl lua_src_install
	dobin bin/croissant
	einstalldocs
}

