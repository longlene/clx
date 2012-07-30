# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Jamendo CD Uploader"
HOMEPAGE="http://www.jamendo.com/fr/jamloader"
SRC_URI="http://img.jamendo.com/releases/jamloader-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="virtual/python
        dev-python/PyQt4"

RDPEND="${DEPEND}"

src_install() {
   dodir /usr/share/jamloader3/
   cp -R "${S}/locale"  "${D}/usr/share/jamloader3/" || die "Install failed!"
   cp -R "${S}/pyjamlib"  "${D}/usr/share/jamloader3/" || die "Install failed!"
   cp -R "${S}/resources"  "${D}/usr/share/jamloader3/" || die "Install failed!"
   cp -f ${S}/jamloader3.py "${D}/usr/share/jamloader3/" || die "Install failed!"
   cp -f ${S}/mainWindow.py "${D}/usr/share/jamloader3/" || die "Install failed!"
   dobin jamloader3.sh || die "Install failed!"

   domenu ${S}/misc/Jamloader.desktop || die "Install failed!"

   dodoc README || die "Install failed!"
   dodoc LICENSE || die "Install failed!"
}

