# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua

DESCRIPTION="SqlTable is a Lua module for accessing databases"
HOMEPAGE="https://zadzmo.org/code/sqltable/"
SRC_URI="https://zadzmo.org/code/sqltable/downloads/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/luadbi
	dev-lua/coxpcall
"

src_install() {
	lua_install_module -r ${PN}{,.lua}
	dodoc -r doc
}
