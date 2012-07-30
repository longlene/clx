# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
WX_GTK_VER=2.8

inherit autotools eutils games wxwidgets

DESCRIPTION="A program to play the abstract board games Zertz, Dvonn and Relax."
HOMEPAGE="http://holtz.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="linguas_de"

DEPEND="x11-libs/wxGTK:2.8[X]"
RDEPEND="${DEPEND}"

src_prepare() {
	# Restrict localization to selected languages:
	echo "SUBDIRS=${LINGUAS}" >locale/Makefile.am || die

	# Don't build/install this test program:
	sed -i '/^bin_PROGRAMS=/d' relax/Makefile.am || die

	eautomake
}

src_configure() {
	egamesconf --enable-wxconfig="${WX_CONFIG}"
}

src_install() {
	# Install files:
	emake DESTDIR="${D}" install || die

	# Create a desktop entry with an application icon:
	newicon icon.xpm ${PN}.xpm || die
	make_desktop_entry ${PN} Holtz ${PN} || die

	prepgamesdirs
}
