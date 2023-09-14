# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="The PosteRazor cuts a raster image into pieces which can afterwards
be printed out and assembled to a poster."
HOMEPAGE="http://posterazor.sourceforge.net/"
SRC_URI="http://downloads.sourceforge.net/project/posterazor/Source%20Releases/${PV}/PosteRazor-${PV}-Source.zip"
RESTRICT="primaryuri"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=x11-libs/fltk-1.1
	>=media-libs/freeimage-3.10.0
	>=x11-libs/libXpm-3.5"
RDEPEND=""

src_unpack() {
	unpack ${A}
	cd src
	epatch "${FILESDIR}"/linux.diff
	cmake .
}

src_compile() {
	cd src
	make
}

src_install () {
	mkdir -p ${D}/usr/bin
	cp src/PosteRazor ${D}/usr/bin
}
