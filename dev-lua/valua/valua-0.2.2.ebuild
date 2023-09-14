# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit lua

DESCRIPTION="Validation for lua"
HOMEPAGE="https://github.com/Etiene/valua"
SRC_URI="https://github.com/Etiene/valua/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module valua.lua
	dodoc README.md
}
