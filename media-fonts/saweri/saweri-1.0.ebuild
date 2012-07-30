# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="Saweri if a TrueType font that is meant to support the lontara (Buginese) script."
HOMEPAGE="http://sites.google.com/site/niariot87"
SRC_URI="http://sites.google.com/site/niariot87/${PN}.zip"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"
