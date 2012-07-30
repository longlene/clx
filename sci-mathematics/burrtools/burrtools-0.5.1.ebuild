# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-mathematics/calc/calc-2.11.10.1.ebuild,v 1.6 2006/06/28 02:19:02 metalgod Exp $

DESCRIPTION="Program to solve assembly and interlocking puzzles"
HOMEPAGE="http://burrtools.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz
         pdf? ( mirror://sourceforge/${PN}/${P}-A4.pdf )"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc-macos ~ppc64 x86"

IUSE="pdf"

DEPEND=">=x11-libs/fltk-1.1.7
	>=media-libs/libpng-1.2.15"

src_compile() {
        econf
	make || die
}

src_install() {
	make install DESTDIR=${D} || die
	if use pdf; then
		insinto /usr/share/doc/${PN}
		doins ${DISTDIR}/${P}-A4.pdf
	fi
}
