# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="PlotDrop is designed for quick simple visualisation of 2D data
series. It is not intended to encompass anywhere near the full capabilities of
gnuplot. "
HOMEPAGE="http://plotdrop.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-libs/glib-2.16
>=x11-libs/gtk+-2.4
gnome-base/libglade
>=sci-visualization/gnuplot-4.0"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"

	epatch "${FILESDIR}"/${P}-getcwd.diff \
			"${FILESDIR}"/${P}-makefile.diff

}

src_compile() {
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die

	dodoc README || die
}
