# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Pluto is a persistence library for Lua."
SRC_URI="http://luaforge.net/frs/download.php/3309/pluto-2.4.tar.gz"
HOMEPAGE="http://luaforge.net/projects/pluto/"
KEYWORDS="~x86"
SLOT="0"
LICENSE="public-domain"
IUSE=""

DEPEND=">=dev-lang/lua-5.1.4-r4"

src_install() {
	mkdir -p ${D}/usr/lib
	cp ${S}/pluto.so ${D}/usr/lib/libpluto.so
	mkdir -p ${D}/usr/include
	cp ${S}/pluto.h ${D}/usr/include
}
