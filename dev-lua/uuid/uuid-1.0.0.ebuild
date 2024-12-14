# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="A pure Lua uuid generator"
HOMEPAGE="http://tieske.github.io/uuid/"
SRC_URI="https://github.com/Tieske/uuid/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}"

DOCS=( README.md )

src_compile() {
	:
}

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r src/uuid{,.lua}
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
