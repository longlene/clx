# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua

DESCRIPTION="LuaCov is a simple coverage analyzer for Lua scripts"
HOMEPAGE="https://github.com/keplerproject/luacov"
SRC_URI="https://github.com/keplerproject/luacov/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

COMMON_DEPEND=">=dev-lang/lua-5.1:="
DEPEND="${COMMON_DEPEND}
virtual/pkgconfig"
RDEPEND="${COMMON_DEPEND}"

src_install() {
	dobin sr/bin/luacov
	lua_install_module -r src/luacov{,.lua}
	dodoc README.md
}

