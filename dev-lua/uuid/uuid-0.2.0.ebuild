# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit lua vcs-snapshot

DESCRIPTION="A pure Lua uuid generator"
HOMEPAGE="http://tieske.github.io/uuid/"
SRC_URI="https://github.com/Tieske/uuid/archive/version_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module src/uuid.lua
	dodoc README.md
}
