# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="8051 assembeler editor, compiler etc."
HOMEPAGE="http://sourceforge.net/projects/mcu8051ide"
SRC_URI="http://prdownloads.sourceforge.net/mcu8051ide/${PN}-${PVR}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~alpha amd64 ~ia64 ~ppc ~sparc x86"

IUSE=""
DEPEND="
	>=dev-tcltk/bwidget-1.7.0
	>=dev-tcltk/itcl-1.7.0
	>=dev-lang/tcl-1.7.0
	>=dev-tcltk/iwidgets-4.0.1
	>=dev-tcltk/tclxml-2.4
	>=dev-tcltk/tcllib-1.6.1
	>=dev-lang/tk-8.4.9
"

MY_DESTDIR=/usr/share/${PN}

src_compile() {
	cd ${WORKDIR}/${PN} || die "Could not change directory."
	./configure --path-to-lib="${MY_DESTDIR}/lib" || die "Launcher creation failed"
}

src_install() {
	dodir ${MY_DESTDIR} || die "Directory creation failed."
	cd ${WORKDIR}/${PN} || die "Could not change directory."
	dobin mcu8051ide || die "Launcher integration failed (dobin mcu8051ide)"
	cp -r ./{demo,doc,lib,icons} ${D}/${MY_DESTDIR} || die "Data installation failed."
	dodoc LICENSE README TODO ChangeLog dependencies.txt
}

pkg_postinst() {
	einfo
	einfo "Type mcu8051ide to run MCU 8051 IDE"
	einfo "You can report any problems or sugestions at http://sourceforge.net/projects/mcu8051ide"
	einfo
}
