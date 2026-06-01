# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="2D physics header-only library for videogames developed in C using raylib"
HOMEPAGE="https://github.com/victorfisac/Physac"
SRC_URI="https://github.com/victorfisac/Physac/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
S="${WORKDIR}"/Physac-${PV}
KEYWORDS="~amd64 ~x86"

RDEPEND="${DEPEND}
	dev-games/physac
"

src_install() {
	insinto /usr/include
	doins src/physac.h
	dodoc README.md
}
