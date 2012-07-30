# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit qt4 eutils

DESCRIPTION="QFSM - QT Finite State Machine Editor"
HOMEPAGE="http://qfsm.sf.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}-Source.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="sys-libs/zlib
		>=x11-libs/qt-4.4.2
		>=dev-util/cmake-2.6.2"

#S=${WORKDIR}/${P}

#src_unpack() {
#	unpack ${A}	
#	#sed -i -e '/qDebug/d' GState.cpp || die "sed"
#}

src_compile() {
	cd ${S}-Source
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
	make || die
}

src_install() {
	cd ${S}-Source
	exeinto /usr/bin
	doexe qfsm

	dodir /usr/share/${PN}
	cp po/*.qm po/*.ts ${D}/usr/share/${PN}
	dodir /usr/share/${PN}/examples
	cp examples/*.fsm ${D}/usr/share/${PN}/examples

	dodir /usr/share/doc/${PN}
	cp doc/user/* ${D}/usr/share/doc/${PN}/
	
	insinto /usr/share/mimelnk/application
	doins desktop/x-qfsm.desktop

	sed -i 's/\.png/\_64/g' desktop/qfsm.desktop

	doicon pics/qfsm_64.xpm

	make_desktop_entry qfsm "QFSM" qfsm_64

	dodir /etc/env.d
	echo "QFSMDIR=/usr/share/${PN}" > ${D}/etc/env.d/99qtfsm
}

