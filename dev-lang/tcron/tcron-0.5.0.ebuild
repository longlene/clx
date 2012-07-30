# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Tcron integrates 'cron' with ATX power-up capability"
HOMEPAGE="http://tcron.sourceforge.net"
SRC_URI="mirror://sourceforge/tcron/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
IUSE=""
DEPEND=""
KEYWORDS="~x86 ~amd64"

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/gentoo-makefile.patch
}

src_install() {
	
	make \
		prefix=${D}/usr \
		mandir=${D}/usr/share/man \
		infodir=${D}/usr/share/info \
		libdir=${D}/usr/$(get_libdir) \
		sysconfdir=${D}/etc \
		install || die
	
	doinitd	${FILESDIR}/tcrond
	dodir /var/spool/tcron
	dodoc AUTHORS Changelog README README.api
}

pkg_postinst() {
	einfo 'Run "rc-update add tcrond default" to run tcron at startup.'
	einfo 'Run "/etc/init.d tcrond start" to start service.'
}
