# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="An implementation of the Markdown text-to-html markup system in pure Lua"
HOMEPAGE="https://github.com/mpeterv/markdown"
SRC_URI="https://github.com/mpeterv/markdown/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins markdown.lua
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
