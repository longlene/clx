# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( luajit )

inherit lua

DESCRIPTION="Lua-capnp is a pure lua implementation of capnproto based on luajit"
HOMEPAGE="https://github.com/calio/lua-capnproto"
SRC_URI="https://github.com/calio/lua-capnproto/archive/v${PV}-5.tar.gz -> ${P}-5.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	${LUA_DEPS}
	dev-libs/capnproto
"

S="${WORKDIR}"/${P}-5

src_compile() {
	:
}

each_src_install() {
	insinto "$(lua_get_lmod_dir)"
	doins -r capnp{,.lua}
}

src_install() {
	lua_foreach_impl each_src_install
	dobin bin/capnpc-lua
	einstalldocs
}

