# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="Raghu family of OpenType fonts for Indian scripts"
HOMEPAGE="http://www.cdacmumbai.in/projects/indix/n_download.shtml"
SRC_URI="http://www.cdacmumbai.in/projects/indix/new-dw/IndiXRaghuFonts.tbz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"

DOCS="./indix/*Readme.txt"

src_unpack() {
	cp ${DISTDIR}/${A} ./${A}2
	unpack ./${A}2
	cd ${S}
	cp -L ./indix/*[^p0-9].ttf ./
	rm RaghuMalayalam.ttf
	
}

pkg_postinst() {
	elog "The Raghu Malayalam font is not included in this ebuild."
	elog "Please use media-fonts/malayalam-fonts, where a newer version"
	elog "of this font is included."
}
