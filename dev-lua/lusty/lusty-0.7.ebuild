# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua

DESCRIPTION="Lua RESTful Web Application Framework"
HOMEPAGE="https://github.com/Olivine-Labs/lusty"
SRC_URI="https://github.com/Olivine-Labs/lusty/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/busted
dev-lua/mediator_lua
"

src_install() {
	lua_install_module -r lusty
	dodoc README.md
}
