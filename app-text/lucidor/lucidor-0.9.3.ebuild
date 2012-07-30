# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
#inherit python distutils eutils fdo-mime bash-completion multilib
inherit eutils fdo-mime


DESCRIPTION="Lucidor is an e-book reader application. It supports e-books
 in the EPUB file format, and catalogs in the OPDS format."

HOMEPAGE="http://lucidor.org/lucidor"

SRC_URI="${HOMEPAGE}/${PN}_${PV}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=">=net-libs/xulrunner-1.9"

LANGS="de en-US it ja sv"

src_prepare() {

	# I don't wont to run make
	rm Makefile

	# build start script
	mkdir bin
	echo "#!/bin/sh" > bin/lucidor
	echo >> bin/lucidor
	xulrunner=`ls /usr/bin/xulrunner* | sort | tail -1`
	echo "$xulrunner /opt/lucidor/application.ini \$*" >> bin/lucidor

	# correction of shared-mime-info
	cp debian.orig/lucidor.sharedmimeinfo lucidor.xml

}


src_install() {
	insinto /opt/
	doins -r  lucidor 

	exeinto /usr/bin
	doexe bin/lucidor

	doman man/lucidor.1
	dodoc credits.txt gpl-3.0.txt readme.html style.css

	# icons
	insinto /usr/share/icons/hicolor/scalable/apps
	doins data/icons/scalable/apps/lucidor.svg
	insinto /usr/share/pixmaps
	doins data/lucidor.xpm

	# menu 
	domenu data/lucidor.desktop

	# mime packages
	insinto /usr/share/mime/packages
	doins lucidor.xml

}


pkg_postinst() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
}
