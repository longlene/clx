# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit lua

DESCRIPTION="Hprose for Lua"
HOMEPAGE="https://github.com/hprose/hprose-lua"
SRC_URI="https://github.com/hprose/hprose-lua/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/luasocket
	dev-lua/date
"

src_install() {
	lua_install_module -r src/hprose{,.lua}
	dodoc README.md
}
