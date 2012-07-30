# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="TrueType font for the Myanmar (Burmese) script"
HOMEPAGE="http://uniburma.sourceforge.net/"
MY_P="UniBurma_Font-${PV}"
SRC_URI="mirror://sourceforge/uniburma/${MY_P}.zip"
FONT_S="${WORKDIR}/${MY_P}"
S="${WORKDIR}/${MY_P}"

LICENSE="OFL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

FONT_SUFFIX="ttf"
DOCS="Change* Readme*"
