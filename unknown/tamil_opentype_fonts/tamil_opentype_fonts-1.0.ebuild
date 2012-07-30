# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

inherit font

DESCRIPTION="Some Tamil fonts from Tamil Linux project"
HOMEPAGE="http://www.tamilinux.org"
SRC_URI="mirror://sourceforge/tamillinux/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${PN}"

FONT_SUFFIX="ttf"
