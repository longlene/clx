# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Use the X Screensaver extension to print user's idle time to stdout."
HOMEPAGE="http://www.dtek.chalmers.se/~henoch/text/xprintidle.html"
SRC_URI="http://www.dtek.chalmers.se/~henoch/text/xprintidle/${P}.tar.gz"

LICENSE="As-Is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-base/xorg-x11"
RDEPEND=""

src_compile() {
	make
}

src_install() {
	dobin xprintidle
}
