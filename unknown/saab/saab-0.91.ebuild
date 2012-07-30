# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

inherit font

DESCRIPTION="Saab is a Punjabi font"
HOMEPAGE="http://guca.sourceforge.net/typography/fonts/saab/"
SRC_URI="mirror://sourceforge/guca/${PN}.${PV}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

S=${WORKDIR}

FONT_SUFFIX="otf"
