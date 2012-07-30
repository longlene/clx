# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="inoticoming is a daemon to watch a directory with Linux's inotify"
SRC_URI="mirror://debian/pool/main/i/${PN}/${PN}_${PV}.orig.tar.gz
	http://alioth.debian.org/frs/download.php/2489/${PN}_${PV}.orig.tar.gz"
HOMEPAGE="http://alioth.debian.org/projects/mirrorer/"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 -ppc -sparc -alpha"
IUSE=""

pkg_setup() {
	enewgroup ${PN}
	enewuser ${PN} -1 -1 -1 ${PN}
}

src_install() {
	emake DESTDIR="${D}" install
	newinitd "${FILESDIR}"/inoticoming.initd inoticoming
	newconfd "${FILESDIR}"/inoticoming.confd inoticoming
	keepdir /var/spool/incoming
}
