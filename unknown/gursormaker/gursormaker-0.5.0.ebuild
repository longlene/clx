# Copyright 2006 Vincent Paeder
# Distributed under the terms of the GNU General Public License v2

inherit distutils

DESCRIPTION="A cursor editor for X11 using GTK+"
HOMEPAGE="http://gursormaker.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P/_}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~ppc ~sparc"
IUSE=""
DEPEND=">=dev-lang/python-2.3
		>=dev-python/pygtk-2.8"

S=${WORKDIR}/${P/_}

src_install() {
    distutils_src_install
}
