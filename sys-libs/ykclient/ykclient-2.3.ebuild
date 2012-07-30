# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="This project implements online validation of Yubikey OTPs, written
in C as a shared library."
HOMEPAGE="http://code.google.com/p/yubico-c-client/"
SRC_URI="http://yubico-c-client.googlecode.com/files/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="net-misc/curl"
RDEPEND="${DEPEND}"

RESTRICT="mirror"

src_unpack() {
	unpack ${A}
	cd "${S}"
	eautoreconf
}


src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc AUTHORS ChangeLog NEWS README || die
}


