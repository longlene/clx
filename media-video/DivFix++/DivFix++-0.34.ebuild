# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

WX_GTK_VER="2.8"
inherit wxwidgets

MY_P="${PN}_v${PV}"
DESCRIPTION="Free AVI video repair and preview program"
HOMEPAGE="http://divfixpp.sourceforge.net"
SRC_URI="mirror://sourceforge/divfixpp/${MY_P}-src.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=x11-libs/wxGTK-2.8"
RDEPEND="${DEPEND}
	virtual/libintl"

S=${WORKDIR}/${MY_P}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	dodoc docs/Change.log docs/ReadMe.txt || die "dodoc failed"
}
