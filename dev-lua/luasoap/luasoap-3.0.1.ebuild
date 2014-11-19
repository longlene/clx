# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit lua

MY_PV=${PV//./_}
MY_P=${PN}-${MY_PV}

DESCRIPTION="A very simple API that convert Lua tables to and from XML documents"
HOMEPAGE="http://www.keplerproject.org/luasoap"
SRC_URI="https://github.com/tomasguisasola/luasoap/archive/v${MY_PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ssl"

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/luaexpat
dev-lua/luasocket
ssl? ( dev-lua/luasec )"

S="${WORKDIR}"/${MY_P}

src_compile() {
	:
}

src_install() {
	local sharedir=$(lua_get_sharedir)
	dodir ${sharedir}
	emake LUA_DIR=${D}/${sharedir} install
}
