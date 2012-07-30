# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

DESCRIPTION="Change LCD brightness on Geforce Go 6200/7200 cards."
HOMEPAGE="http://www.acc.umu.se/~erikw"
SRC_URI="http://www.acc.umu.se/~erikw/program/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

src_unpack() {
	unpack ${A}
	epatch "${FILESDIR}"/${PN}-fading.patch
	mv "${PN}" "${P}"
}

src_compile() {
#	cd work
	econf || die "econf failed"
	make || die "emake failed"
}

src_install() {
	install -D src/smartdimmer ${D}/usr/bin/smartdimmer \
		|| die "Installation failed"
	dodoc README
}
