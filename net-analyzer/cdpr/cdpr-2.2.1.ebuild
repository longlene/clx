# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Cisco Discovery Protocol Reporter"
HOMEPAGE="http://cdpr.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86"
IUSE=""

DEPEND="net-libs/libpcap"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-man.patch
}

src_install() {
	dosbin cdpr
	doman cdpr.8
	dodoc COPYING INSTALL license.txt README README.cdprs 
	cp -r "${S}/cdprs" "${D}/usr/share/doc/${PF}/"
	cp -r "${S}/cdpr.conf" "${D}/usr/share/doc/${PF}/cdpr.conf.sample"
}
