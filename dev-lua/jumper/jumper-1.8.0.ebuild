# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit lua vcs-snapshot

DESCRIPTION="Fast, lightweight and easy-to-use pathfinding library for grid-based games"
HOMEPAGE="https://github.com/Yonaba/Jumper"
SRC_URI="https://github.com/Yonaba/Jumper/archive/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module -r jumper
	dodoc README.md
}
