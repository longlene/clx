# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools

DESCRIPTION="A frontend to the LD_AUDIT tracing framework in glibc"
HOMEPAGE="http://latrace.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	eautoconf
}

src_install() {
	insinto /etc
	doins etc/latrace.conf || die
	doman doc/latrace.1 || die
	dodoc ReleaseNotes TODO || die
	dobin latrace || die
	dolib libltaudit.so || die
}
