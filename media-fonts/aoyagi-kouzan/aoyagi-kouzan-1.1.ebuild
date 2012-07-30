# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="A beautiful calligraphic font for Kanji"
HOMEPAGE="http://musashi.or.tv/aoyagikouzanfont.htm"
SRC_URI="http://www.interq.or.jp/www1/anzawa/bin/${PN/-}2otfv${PV/.}.lzh"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="virtual/libiconv
	app-arch/lha"
RDEPEND=""

FONT_S="${WORKDIR}"
S="${FONT_S}"
FONT_SUFFIX="otf"

src_unpack() {
	cd "${S}"
	unpack "${A}"
	iconv --from-code=CP932 --to-code=UTF-8 --output=README *OTF*.txt || die "Conversion failed"
}
DOCS="README"
