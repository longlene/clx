# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua

DESCRIPTION="Pure Lua driver for Apache Cassandra"
HOMEPAGE="https://thibaultcha.github.io/lua-cassandra"
SRC_URI="https://github.com/thibaultcha/lua-cassandra/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/LuaBitOp
"

src_compile() {
	:
}

src_install() {
	lua_install_module -r lib/{cassandra,resty}
	dodoc README.md
}
