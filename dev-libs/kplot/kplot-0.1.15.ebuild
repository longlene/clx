# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

MY_PV=${PV//./_}

DESCRIPTION="Cairo plotting library"
HOMEPAGE="https://kristaps.bsd.lv/kplot"
SRC_URI="https://github.com/kristapsdz/kplot/archive/VERSION_${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="x11-libs/cairo"
RDEPEND="${DEPEND}"

src_compile() {
	emake libkplot.a
}

src_install() {
	dolib.a libkplot.a
	insinto /usr/include
	doins kplot.h
	doman man/*.3
	dodoc README.md
}
