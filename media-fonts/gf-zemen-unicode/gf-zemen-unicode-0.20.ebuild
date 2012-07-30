# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="A font for Ge'ez - the script used in Amharic and Tigrinya"
HOMEPAGE="ftp://ftp.ethiopic.org/pub/fonts/TrueType/"
SRC_URI="ftp://ftp.ethiopic.org/pub/fonts/TrueType/gfzemenu.ttf
	ftp://ftp.ethiopic.org/pub/fonts/TrueType/README.gff
	ftp://ftp.ethiopic.org/pub/fonts/TrueType/README.zemen
	ftp://ftp.ethiopic.org/pub/fonts/TrueType/UPDATE"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"

src_unpack() {
	cp -a "${DISTDIR}"/* "${WORKDIR}"
}

DOCS="README.gff README.zemen UPDATE"
