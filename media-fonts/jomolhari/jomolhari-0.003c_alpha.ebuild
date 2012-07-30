# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="A font for Dzongkha - a Bhutanese style Tibetan script"
HOMEPAGE="http://chris.fynn.googlepages.com/jomolhari"
SRC_URI="http://download.savannah.nongnu.org/releases/free-tibetan/jomolhari/${PN}-alpha3c.tar.gz"

LICENSE="OFL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"

src_unpack() {
	unpack ${A}
	cd "${S}"
	
	mv Jomolhari-alpha3c-0605331.ttf jomolhari.ttf
}
