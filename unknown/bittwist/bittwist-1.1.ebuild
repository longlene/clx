# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Libpcap-based Ethernet packet generator"
HOMEPAGE="http://bittwist.sourceforge.net/"
SRC_URI="http://prdownloads.sourceforge.net/bittwist/bittwist-linux-1.1.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="net-libs/libpcap"
RDEPEND="${DEPEND}"

src_compile() {
	emake || die "emake failed"
}

src_install() {
	dobin src/bittwist
	dobin src/bittwistb
	dobin src/bittwiste
	
	if use doc
	then
		doman doc/bittwist.1
		doman doc/bittwistb.1
		doman doc/bittwiste.1
		dodoc doc/bittwist.1.html
		dodoc doc/bittwistb.1.html
		dodoc doc/bittwiste.1.html
	fi
}

pkg_postinst() {
	einfo
	einfo "Bit-Twist is designed to complement net-analyzer/tcpdump"
	einfo
}
