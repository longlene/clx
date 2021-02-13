# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..3} luajit )

inherit lua vcs-snapshot

EGIT_COMMIT="b2af2d336e808e763b424d2ea42e6a2c2b4aa24d"

DESCRIPTION="A collection of interactive command line prompts for Lua"
HOMEPAGE="https://github.com/giann/sirocco"
SRC_URI="https://github.com/giann/sirocco/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND=""
RDEPEND="${DEPEND}
	${LUA_DEPS}
	>=dev-lua/lua-term-0.7
	>=dev-lua/hump-0.4
	>=dev-lua/wcwidth-0.3
	>=dev-lua/compat53-0.7
	>=dev-lua/lua-bit32-5.2.0
	dev-lua/lua-tui
"
BDEPEND=""

DOCS=( README.md )

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r sirocco
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
