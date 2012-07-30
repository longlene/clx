# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

KEYWORDS="~x86"
DESCRIPTION="bmeps converts various bitmap picture formats to eps"
HOMEPAGE="http://bmeps.sourceforge.net/"
SRC_URI="mirror://sourceforge/bmeps/${P}.tar.gz"
LICENSE="BSD"
RESTRICT="firsturi"
SLOT="2"

DEPEND="
	dev-libs/dklibs
	sys-libs/zlib
	media-libs/libpng
	media-libs/jpeg
	media-libs/netpbm
"

src_install() {
	dobin ${WORKDIR}/${P}/bmeps || die
	dolib.a ${WORKDIR}/${P}/libbmeps.a || die
	doman ${WORKDIR}/${P}/man/man1/bmeps.1
	mv ${WORKDIR}/${P}/share/bmeps ${D}usr/share/
	mv ${WORKDIR}/${P}/share/doc/bmeps/bmeps.pdf ${D}usr/share/bmeps
	mv ${WORKDIR}/${P}/contrib ${D}usr/share/bmeps
}
