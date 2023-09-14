# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="A collection of fonts for Arabic"
HOMEPAGE="http://sourceforge.net/projects/paktype/"
SRC_URI="mirror://sourceforge/paktype/PakType-Tehreer1.3.zip
	mirror://sourceforge/paktype/PakType-Naqsh2.2.zip
	mirror://sourceforge/paktype/PakType-NaskhBasic1.0.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"

src_unpack() {
	unpack ${A}
	cd "${S}"
	#This to give the fonts some less chavvy names.
	for FONTFILE in ./*.ttf; do
		[[ "${FONTFILE}" =~ ([A-Za-z]+)[^A-Za-z]([A-Za-z]+) ]]
		local PARTONE=$( echo "${BASH_REMATCH[1]}" | tr '[A-Z]' '[a-z]')
		local PARTTWO=$( echo "${BASH_REMATCH[2]}" | tr '[A-Z]' '[a-z]')
		mv ./"${FONTFILE}" ./"${PARTONE}"-"${PARTTWO}".ttf
	done
}

DOCS=""
