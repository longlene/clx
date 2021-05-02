# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit lua

DESCRIPTION="Lua proxy to access a Lua state from within another state"
HOMEPAGE="https://github.com/arcapos/luaproxy"
SRC_URI="https://github.com/arcapos/luaproxy/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_cmodule proxy.so
}
