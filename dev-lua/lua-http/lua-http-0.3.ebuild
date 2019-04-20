# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua

DESCRIPTION="HTTP Library for Lua"
HOMEPAGE="https://github.com/daurnimator/lua-http"
SRC_URI="https://github.com/daurnimator/lua-http/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/bit32
	dev-lua/cqueues
	dev-lua/luaossl
	dev-lua/basexx
	dev-lua/lpeg
	dev-lua/lpeg_patterns
	dev-lua/fifo
"

src_install() {
	lua_install_module -r http
	dodoc README.md
}
