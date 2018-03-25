# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="2D physics header-only library for videogames developed in C using raylib library"
HOMEPAGE="https://github.com/victorfisac/Physac"
SRC_URI="https://github.com/victorfisac/Physac/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-games/physac
"

S="${WORKDIR}"/Physac-${PV}

src_install() {
	insinto /usr/include
	doins src/physac.h
	dodoc README.md
}
