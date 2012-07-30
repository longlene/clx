# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
DESCRIPTION="OpenLaszlo is an open source platform for creating zero-install web 
applications with the user interface capabilities of desktop client software.

OpenLaszlo programs are written in XML and JavaScript and transparently compiled
to Flash and, with OpenLaszlo 4, DHTML.

OpenLaszlo is 'write once, run everywhere'. An OpenLaszlo application developed
on one machine will run on all leading Web browsers on all leading desktop
operating systems."

MY_PV=${PV/4.0.0/4.0.0}
HOMEPAGE="http://www.openlaszlo.org"
SRC_URI="http://download.openlaszlo.org/${MY_PV}/${PN}-${MY_PV}-unix.tar.gz"

LICENSE="CPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
USE=""
IUSE=""
DEPEND="media-fonts/gnu-gs-fonts-std
        virtual/jdk"
RDEPEND="|| (
			www-servers/tomcat
			net-www/apache
			)"

S=${WORKDIR}/lps-${MY_PV}


src_install() {

	declare OPENLASZLO_HOME=/opt/openlaszlo4

	# Remove shipped Tomcat server installation since
	# if the user wants TomCat he/she'll install it
	# using portage
	rm -fr ${S}/Server/tomcat-*

	# Remove the *.bat files from the bin folder since
	# this is a linux system
	rm -f ${S}/bin/*.bat

	# Install OpenLaszlo  in /opt
	dodir ${OPENLASZLO_HOME%/*}
	mv ${S} ${D}${OPENLASZLO_HOME}

	# Install icon
	mv ${D}${OPENLASZLO_HOME}/Server/misc/logo.gif \
	${D}${OPENLASZLO_HOME}/Server/misc/${PN}-logo.gif
	insinto /usr/share/pixmaps
	doins ${D}${OPENLASZLO_HOME}/Server/misc/${PN}-logo.gif

	# revdep-rebuild entry
	insinto /etc/revdep-rebuild
	doins ${FILESDIR}/99openlaszlo

	# install ldpath env.d
	insinto /etc/env.d
	doins ${FILESDIR}/90openlaszlo
}
