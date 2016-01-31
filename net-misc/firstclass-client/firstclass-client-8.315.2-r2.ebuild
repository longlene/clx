# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit versionator eutils

MY_PV=$(replace_version_separator 2 '-' )

DESCRIPTION="FirstClass Client for Linux"
HOMEPAGE="http://www.firstclass.com/index.shtml"
SRC_URI="http://www3.firstclass.com/ClientDownloads/FC83ClientDownloadFiles/fcc-${MY_PV}-Linux.i686.tar.bz2"

# OpenText's license says:
# You are free to install and distribute this software providing it is
# distributed in its entirety and no modifications are made. All other
# rights are reserved by Open Text Corporation.
#
# I guess this needs to be added to the Portage licenses.

LICENSE=""
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=">=x11-libs/qt-3.3.3:3
         >=media-libs/alsa-lib-1.0.15"

src_compile() {
	einfo "No compilation required..."
}

src_install() {
	dodir "/opt/firstclass"
	cp -ar opt/firstclass/* ${D}/opt/firstclass/
	domenu "usr/share/applications/fcc.desktop"
	echo "PATH=\"/opt/firstclass\"" > 99fcc
	doenvd 99fcc
}
