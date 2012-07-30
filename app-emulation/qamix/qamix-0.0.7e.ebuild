# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $



DESCRIPTION="QAMix is a configurable mixer for ALSA. Interfaces for AC 97 cards and Soundblaster Live are provided."
SRC_URI="http://mesh.dl.sourceforge.net/sourceforge/alsamodular/${P}.tar.bz2"
HOMEPAGE="http://alsamodular.sourceforge.net/"

SLOT="0"
LICENSE="GPL"
KEYWORDS="x86"

DEPEND="virtual/x11
	x11-libs/qt"

src_compile() {
    sed \
       -e "s:/usr/lib/qt3:${QTDIR}:" \
       -e "s:-O2 -g:${CXXFLAGS}:" \
       < make_qamix > Makefile

    emake || die
}
			

src_install () {
    dobin qamix || die

    insinto /usr/share/${PN}
    doins *.xml
    
    
    dodoc LICENSE README
}
