# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua

DESCRIPTION="Simple wrapper around luasocket smtp.send"
HOMEPAGE="https://github.com/moteus/lua-sendmail"
SRC_URI="mirror://github/moteus/lua-sendmail/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/luasocket
"

src_install() {
	lua_install_module lua/sendmail.lua
	dodoc README.md
}
