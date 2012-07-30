# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator

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
# Dependencies from http://www.firstclass.com/products/SysReq
RDEPEND=">=x11-libs/qt-3.3.3
         sys-libs/glibc"

src_unpack() {
	mkdir ${S}
	cd ${S}
	unpack fcc-${MY_PV}-Linux.i686.tar.bz2
}

src_compile() {
	einfo "No compilation required..."
}

src_install() {
	einfo "Installing program files..."
	dodir "/opt/firstclass"
	cp -ar ${S}/opt/firstclass/* ${D}/opt/firstclass/
	einfo "Installing .desktop file..."
	dodir "/usr/share/applications"
	cp -ar ${S}/usr/share/applications/fcc.desktop ${D}/usr/share/applications
	einfo "Installing env.d file..."
	echo "PATH=\"/opt/firstclass\"" > ${S}/99fcc
	doenvd ${S}/99fcc
}
