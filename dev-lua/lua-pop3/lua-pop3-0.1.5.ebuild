# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua

DESCRIPTION="POP3 client library for Lua"
HOMEPAGE="https://github.com/moteus/lua-pop3"
SRC_URI="https://github.com/moteus/lua-pop3/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
>=dev-lua/luasocket-2.0
dev-lua/lua-iconv
dev-lua/luacrypto
dev-lua/lpeg
"

src_prepare() {
	rm -r lua/pop3/win
}

src_install() {
	lua_install_module -r lua/{pop3,pop3.lua}
	dodoc README.md
}
