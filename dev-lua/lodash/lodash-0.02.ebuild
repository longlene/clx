# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua

DESCRIPTION="A functional programming library for lua"
HOMEPAGE="https://github.com/axmat/lodash.lua"
SRC_URI="https://github.com/axmat/lodash.lua/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}.lua-${PV}

src_install() {
	lua_install_module src/lodash.lua
	dodoc README.md
}
