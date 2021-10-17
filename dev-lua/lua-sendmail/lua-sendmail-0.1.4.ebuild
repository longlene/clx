# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua

DESCRIPTION="Simple wrapper around luasoket smtp.send"
HOMEPAGE="https://github.com/moteus/lua-sendmail"
SRC_URI="https://github.com/moteus/lua-sendmail/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/luasocket
"

src_install() {
	lua_install_module lua/sendmail.lua
	dodoc README.md
}
