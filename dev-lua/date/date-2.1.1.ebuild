# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit lua

DESCRIPTION="Date & Time module for Lua"
HOMEPAGE="http://tieske.github.io/date/"
SRC_URI="mirror://github/Tieske/date/archive/version_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=">=dev-lang/lua-5.1"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}-version_${PV}

src_install() {
	lua_install_module date.lua
}
