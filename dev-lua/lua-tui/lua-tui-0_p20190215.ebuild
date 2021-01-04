# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..3} luajit )

inherit lua vcs-snapshot

EGIT_COMMIT="9e854fc22074d73a26fbf25cf24690c60b042b11"

DESCRIPTION="lua library for creating a terminal UI"
HOMEPAGE="https://github.com/daurnimator/lua-tui"
SRC_URI="https://github.com/daurnimator/lua-tui/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

REQUIRED_USE="${LUA_REQUIRED_USE}"

RDEPEND="${LUA_DEPS}"
DEPEND="${RDEPEND}"
BDEPEND=""

DOCS=( README.md )

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r tui
}

src_install() {
	lua_foreach_impl lua_src_install

	einstalldocs
}
