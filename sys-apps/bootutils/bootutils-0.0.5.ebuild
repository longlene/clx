# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Utilities to facilitate booting of kernel 2.6 based systems"
HOMEPAGE="http://bootutils.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/libblkid-fix.patch"
}

src_compile() {
	econf \
		--bindir="${ROOT}/bin" \
		--sbindir="${ROOT}/sbin" \
		|| die "econf failed"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die "install failed"
	dodoc AUTHORS ChangeLog FEATURES NEWS README
	newdoc examples/init init_example
}
