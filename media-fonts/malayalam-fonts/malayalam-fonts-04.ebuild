# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="A collection of fonts for Malayalam by the SMC project"
HOMEPAGE="http://savannah.nongnu.org/projects/smc/"
SRC_URI="http://download.savannah.nongnu.org/releases/smc/fonts/${P}.zip"

LICENSE="GPL-2 GPL-2-with-exceptions"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}/${P}"
FONT_S="${S}"
FONT_SUFFIX="ttf"

src_unpack() {
	unpack ${A}
	cd "${S}"
	#This to give the fonts some less chavvy names.
	for FONTFILE in ./*.ttf; do
		[[ "${FONTFILE}" =~ ([A-Za-z]+)[^A-Za-z] ]]
		mv ./"${FONTFILE}" ./"${BASH_REMATCH[1]}".ttf
	done
}

DOCS="README.txt"
