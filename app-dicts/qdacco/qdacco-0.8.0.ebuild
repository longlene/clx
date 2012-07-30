# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit cmake-utils

DESCRIPTION="Catalan - English dictionary"
HOMEPAGE="http://dacco.sourceforge.net"
SRC_URI="mirror://sourceforge/dacco/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND=""
RDEPEND="${DEPEND}
app-dicts/dacco
x11-libs/qt-core
x11-libs/qt-gui
"
DOCS="CHANGELOG.txt INSTALL.ca INSTALL.en COPYING README TODO"

src_unpack() {
	unpack ${A} || die "unpack failed"
	mv qdacco ${P}
}
