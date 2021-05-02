# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit lua

DESCRIPTION="A WebSocket implementation for Lua"
HOMEPAGE="https://github.com/arcapos/luawebsocket"
SRC_URI="https://github.com/arcapos/luawebsocket/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="doc"

DEPEND="dev-libs/openssl"
RDEPEND="${DEPEND}"

src_install() {
	lua_install_cmodule websocket.so
	dodoc README.md
}
