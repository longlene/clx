# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua vcs-snapshot

DESCRIPTION="GraphQL implementation in Lua"
HOMEPAGE="https://github.com/bjornbytes/graphql-lua"
SRC_URI="https://github.com/bjornbytes/graphql-lua/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/lpeg
"

src_install() {
	lua_install_module graphql{,.lua}
	dodoc README.md
}
