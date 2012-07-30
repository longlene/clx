# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A Tool to display large text on screen"
HOMEPAGE="http://www.joachim-breitner.de/blog/archives/142-Vorlesungskommunikation.html"
SRC_URI="http://www.joachim-breitner.de/various/vlshow.py"

LICENSE="GPL"
KEYWORDS="~ppc ~x86"
SLOT="0"

DEPEND=""
RDEPEND=">=virtual/python-2.4
	>=dev-python/pygtk-2.10"

S="${DISTDIR}/"

src_install() {
	dobin vlshow.py
}
