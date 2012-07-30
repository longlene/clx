# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="Tagalog Doctrina 1593 is based on the typeface used in one of the very first books printed in the Philippines, the Doctrina Christiana of 1593."
HOMEPAGE="http://www.mts.net/~pmorrow/fonts.htm"
SRC_URI="http://www.mts.net/~pmorrow/${PN}93.zip"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"
