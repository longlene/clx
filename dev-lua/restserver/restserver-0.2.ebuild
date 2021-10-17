# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua

DESCRIPTION="A simple server API for writing REST services running over WSAPI"
HOMEPAGE="https://github.com/hishamhm/restserver"
SRC_URI="https://github.com/hishamhm/restserver/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/wsapi
	dev-lua/dkjson
	dev-lua/xavante
	dev-lua/wsapi-xavante
"

src_install() {
	lua_install_module -r restserver{,.lua}
	dodoc README.md
}
