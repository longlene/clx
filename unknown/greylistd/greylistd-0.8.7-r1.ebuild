# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/mail-filter/greylistd/greylistd-0.8.7.ebuild,v 1.2 2011/07/18 14:32:21 droid Exp $

inherit eutils

DESCRIPTION="Greylistd is a Exim4 policy server implementing greylisting"
SRC_URI="http://ftp.debian.org/debian/pool/main/g/${PN}/${PN}_${PV}+nmu2.tar.gz"
HOMEPAGE="http://packages.debian.org/unstable/source/${PN}"
LICENSE="GPL-2"
SLOT="0"
IUSE=""
DEPEND=""
RDEPEND=">=dev-lang/python-2.3.0"

KEYWORDS="x86 amd64"

S=${WORKDIR}/${PN}

pkg_setup() {
	enewgroup ${PN}
	enewuser ${PN} -1 -1 /dev/null ${PN}
}

src_install () {
	cd ${S}
	# greylistd data/DB & socket in /var
	diropts -m0770 -o ${PN} -g ${PN}
	for dir in lib run; do
		dodir /var/${dir}/${PN}
		fowners ${PN}:${PN} /var/${dir}/${PN}
		fperms 0770 /var/${dir}/${PN}
	done
	# greylistd binary
	dosbin program/${PN}
	dobin	program/greylist

	# greylistd data in /etc/greylistd
	insinto /etc/${PN}
	insopts -o root -g ${PN} -m 0640
	doins config/whitelist-hosts
	doins config/config

	# documentation
	dodoc ${S}/doc/examples/*
	doman ${S}/doc/man8/${PN}.8
	doman ${S}/doc/man8/${PN}-setup-exim4.8
	doman ${S}/doc/man1/greylist.1
	
	# init.d + conf.d files
	newinitd ${FILESDIR}/${PN}-init ${PN}
}

pkg_postinst() {
	echo
	einfo "To make use of greylisting, please update your exim config:"
	einfo "Read: /usr/share/doc/${P}/exim4-acl-example.txt.gz"
	einfo 
	einfo "In order to complete this installation you have to add the user"
	einfo "mail to the group ${PN}. usermod -g mail -G ${PN} mail"
	einfo
	einfo
	einfo "Also remember to make the daemon start during system boot:"
	einfo "rc-update add ${PN} default"
	echo
	ewarn "Read ${PN} documentation for more info."
	echo
	epause 5
}
