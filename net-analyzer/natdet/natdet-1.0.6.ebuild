# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="NAT Detection tool"
HOMEPAGE="http://elceef.itsec.pl/natdet"
SRC_URI="http://elceef.itsec.pl/${PN}/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=net-libs/libpcap-0.6.0"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	insinto /sbin
	doins natdet
	fperms 754 /sbin/natdet
	insinto /usr/local/share/natdet
	doins signatures
	dodoc doc/*
	doman doc/natdet.1
}
