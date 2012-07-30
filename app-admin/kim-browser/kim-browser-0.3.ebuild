# Copyright 1999-2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit flag-o-matic

DESCRIPTION="The KDE CIM Browser is a KDE based frontend to management brokers using the CIM-XML protocol"
HOMEPAGE="http://kde-cim.sourceforge.net/"
SRC_URI="mirror://sourceforge/kde-cim/${P}.tar.bz2"

DEPEND="virtual/libc
		dev-libs/openssl
		net-libs/openslp
		app-admin/openwbem"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""
localstatedir="/var/lib"

src_unpack() {
	unpack ${A}
	cd ${S}
}

src_compile() {
	addpredict ${QTDIR}/etc/settings
	econf --with-openwbem=/usr || die
	emake || die
}

src_install () {
	make DESTDIR=${D} install || die
	
	cd ${S}
	dodoc README TODO AUTHORS COPYING ChangeLog INSTALL NEWS
}
