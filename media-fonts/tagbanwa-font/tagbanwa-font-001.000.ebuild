# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="A crude font for the Tagbanwa script"
HOMEPAGE="http://youpibouh.thefreecat.org/download/tagbanwa.htm"
SRC_URI="http://youpibouh.thefreecat.org/download/${PN/-font}.zip"

LICENSE="CCPL-Attribution-2.5"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

FONT_S="${WORKDIR}/${PN/-font}"
S="${FONT_S}"
FONT_SUFFIX="ttf"

DOCS="${PN/-font}.txt"
