# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua

EGIT_COMMIT="1becd4d007727ebfcad8edfa267806452c8e981d"

DESCRIPTION="Lua WSAPI Library"
HOMEPAGE="https://github.com/keplerproject/wsapi"
SRC_URI="https://github.com/keplerproject/wsapi/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/luafcgi
	dev-lua/luafilesystem
"

src_compile() {
	:
}

src_install() {
	lua_install_module -r src/wsapi{,.lua}
	dobin src/launcher/wsapi.cgi
	dodoc README.md
}
