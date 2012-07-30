# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

WX_GTK_VER="2.8"

inherit wxwidgets

MY_P="${PN}_v${PV}"
S="${WORKDIR}/${MY_P}"

DESCRIPTION="Free AVI video repair / fix & preview program."
HOMEPAGE="http://divfixpp.sourceforge.net"
SRC_URI="mirror://sourceforge/divfixpp/${MY_P}-src.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=x11-libs/wxGTK-2.8
	sys-devel/gettext"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	sed -i \
		-e 's:^CXXFLAGS.*:CXXFLAGS+=`$(WXCONFIG) --cxxflags` -c:' \
		-e 's:^LDFLAGS.*:LDFLAGS+=`$(WXCONFIG) --libs`:' \
		makefile || die "sed failed"
}

src_compile() {
	emake WXCONFIG=${WX_CONFIG} || die "emake failed"
}

src_install() {
	#missing in makefile
	dodir /usr/share/{pixmaps,applications}

	emake DESTDIR="${D}" install || die "make install failed"
	dodoc docs/Change.log docs/ReadMe.txt
}
