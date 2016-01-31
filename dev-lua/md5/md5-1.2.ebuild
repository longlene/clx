# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua

DESCRIPTION="MD5 offers basic cryptographic facilities for Lua"
HOMEPAGE="https://github.com/keplerproject/md5"
SRC_URI="mirror://github/keplerproject/md5/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -e '/PREFIX/ s:/local::' \
		-e "/LUA_LIBDIR/ s:lib:$(get_libdir):" \
		-e "/LUA_/ s:5.1:${LUAVER}:" \
		-i config
}

src_install() {
	mkdir md5
	cp src/core.so md5/core.so
	lua_install_module src/md5.lua
	lua_install_cmodule -r md5 src/des56.so
	dodoc README
}
