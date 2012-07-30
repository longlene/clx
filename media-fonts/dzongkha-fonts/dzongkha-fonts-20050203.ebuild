# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="Fonts for Dzongkha - a Bhutanese style Tibetan script"
HOMEPAGE="http://www.dit.gov.bt/downloads.php"
SRC_URI="http://www.dit.gov.bt/downloads/dzongkhafonts.zip"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"

src_unpack() {
	cd ${S}
	unpack ${A}
	unpack ./*.zip
	#Rename files to something resembling their real names.
	mv ./Tashi.ttf ./XTashi.ttf
	mv ./Joyig.ttf ./Wangdi29.ttf
	mv ./UChen.ttf ./UChen_05.ttf
}
