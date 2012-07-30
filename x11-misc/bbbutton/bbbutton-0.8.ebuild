# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Dockapp for (not only blackbox) to launch applications"
HOMEPAGE="http://bbbutton.sourceforge.net/"

MY_P=${PN}_${PV}
SRC_URI="http://bbbutton.sourceforge.net/$MY_P.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"


S=${WORKDIR}/${MY_P} 


src_compile() {
	emake linux || die "make failed, go have a beer dude"
}

src_install() {
	exeinto /usr/bin
	doexe ${PN}
	dodir /usr/share/${PN}/
	cp -R sampleIcons ${D}/usr/share/${PN}/
	cp .bbbuttonrc ${D}/usr/share/${PN}/bbbuttonrc.example
	dodoc CHANGES README
}


