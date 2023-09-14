# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="Chat bot engine based on Markov chains"
HOMEPAGE="https://github.com/darkstalker/lua_brain"
SRC_URI="https://github.com/darkstalker/lua_brain/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/lsqlite3[${LUA_USEDEP}]
	dev-lua/luautf8[${LUA_USEDEP}]
"

S="${WORKDIR}"/lua_${P}

DOCS=( README.md )

each_lua_install() {
	insinto "$(lua_get_lmod_dir)"
	doins -r src/{brain,brain.lua}
}

src_install() {
	lua_foreach_impl each_lua_install
	einstalldocs
}
