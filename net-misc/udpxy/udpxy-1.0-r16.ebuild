# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Daemon to relay multicast UDP traffic to client's TCP (HTTP) connection"
HOMEPAGE="http://sourceforge.net/projects/udpxy"
SRC_URI="mirror://sourceforge/${PN}/${PN}.${PV}-Chipmunk-16.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${PN}-${PV}-Chipmunk-16"

src_unpack() {
	unpack ${A}
	cd ${S}
}

src_compile() {
	emake -j1 || die "emake failed"
}

src_install() {
	dobin udpxy || die
	dosym /usr/bin/udpxy /usr/bin/udpxrec

	newinitd "${FILESDIR}"/udpxy-init.d udpxy || die
	newconfd "${FILESDIR}"/udpxy-conf.d udpxy || die
}
