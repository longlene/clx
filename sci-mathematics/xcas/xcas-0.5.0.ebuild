# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit python

DESCRIPTION="Xcas is a FLTK GUI for the Giac computer algebra system"
HOMEPAGE="http://xcas.sourceforge.net"
SRC_URI="mirror://sourceforge/xcas/${P}.tar.bz2"
RESTRICT="nomirror"

LICENSE="GPL-2"
KEYWORDS="~x86"
IUSE="debug"
SLOT="0"

DEPEND=">=sci-mathematics/giac-0.5.0
	x11-libs/flvw"

src_compile() {
	myconf=""

	use debug    && myconf="${myconf} BUILD=debug"

	emake -f GNUmakefile ${myconf} CXXFLAGS="${CXXFLAGS}" LDFLAGS="${LDFLAGS}" || die
}

src_install() {
        einstall ${myconf} || die "einstall failed"

        dodoc README* AUTHORS NEWS TROUBLES
}
