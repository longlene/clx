# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit lua

DESCRIPTION="Lua-capnp is a pure lua implementation of capnproto based on luajit"
HOMEPAGE="https://github.com/calio/lua-capnproto"
SRC_URI="https://github.com/calio/lua-capnproto/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-libs/capnproto
"

src_compile() {
	:
}

src_install() {
	dobin bin/capnpc-lua bin/capnpc-echo bin/schema.capnp
	lua_install_module -r capnp.lua capnp
	dodoc README.md
}

