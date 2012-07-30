# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

MY_P="RomanCyrillicStd"
DESCRIPTION="Supports Unicode 5.1 in all relevant areas (Latin, Cyrillic, Phonetics, Diacritics)."
HOMEPAGE="http://kodeks.uni-bamberg.de/AKSL/Schrift/${MY_P}.htm"
SRC_URI="http://kodeks.uni-bamberg.de/AKSL/media/${MY_P}.zip"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="app-arch/unzip"
RDEPEND=""

FONT_SUFFIX="ttf"

S="${WORKDIR}/${MY_P}"
FONT_S="${S}"

src_install() {
	font_src_install
	use doc && dodoc *.pdf
}
