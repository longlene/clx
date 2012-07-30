# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A command line program to access an EMS USB memory card / adapter \
for the Nintendo Gamecube."
HOMEPAGE="http://www.wongr.net/emslink/"
SRC_URI="http://www.wongr.net/emslink/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~sparc ~mips ~ppc ~ia64"

DEPEND=">=dev-libs/libusb-0.1.12"
RDEPEND=${DEPEND}

src_unpack() {
	einfo "Unpacking source..."
	unpack ${A} || die "Unpacking failed"
}

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_compile() {
	emake DESTDIR=$"{D}" install || die "install failed"
}
