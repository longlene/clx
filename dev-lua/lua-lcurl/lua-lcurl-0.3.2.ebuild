# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua

DESCRIPTION="Lua binding to libcurl"
HOMEPAGE="https://github.com/moteus/lua-lcurl"
SRC_URI="https://github.com/moteus/lua-lcurl/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
net-misc/curl
"

src_install() {
	lua_install_cmodule lcurl.so
	lua_install_module -r src/lua/{cURL,cURL.lua}
	dodoc README.md
}
