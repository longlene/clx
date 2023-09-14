# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="LibYAML binding for Lua"
HOMEPAGE="http://gvvaughan.github.io/lyaml"
SRC_URI="https://github.com/gvvaughan/lyaml/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/libyaml
"

lua_src_compile() {
	${ELUA} build-aux/luke || die
}

src_compile() {
	lua_foreach_impl lua_src_compile
}

lua_src_install() {
	insinto $(lua_get_cmod_dir)
	doins linux/yaml.so
	insinto $(lua_get_lmod_dir)
	doins -r lib/lyaml
}

src_install() {
	lua_foreach_impl lua_src_install
	dodoc README.md
}
