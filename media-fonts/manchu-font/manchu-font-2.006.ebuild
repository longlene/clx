# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="A Free Manchu OpenType font"
HOMEPAGE="http://sourceforge.net/projects/manchufont/"
SRC_URI="mirror://sourceforge/${PN/-}/Manchu_Font_2005_${PV}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"
DOCS="ReadMe.txt"
