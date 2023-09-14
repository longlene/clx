# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua

DESCRIPTION="Lua driver for MongoDB"
HOMEPAGE="https://github.com/mwild1/luamongo/"
SRC_URI="https://github.com/moai/luamongo/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	|| ( >=dev-lang/lua-5.1 dev-lang/luajit:2 )
	dev-libs/boost
	dev-db/mongodb
"
DEPEND="${RDEPEND}"

src_compile() {
	local lua=lua;
	use luajit && lua=luajit;
	emake LUA_INC="-I$($(tc-getPKG_CONFIG) --variable includedir ${lua})"
}

src_install() {
	lua_install_cmodule mongo.so
	dodoc README.md
}
