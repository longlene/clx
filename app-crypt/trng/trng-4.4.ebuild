# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Tina's Random Number Generator Library"
HOMEPAGE="http://trng.berlios.de/"
SRC_URI="http://download.berlios.de/trng/trng-4.4.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

src_compile() {
    econf --with-posix-regex || die "econf failed"
    emake || die "emake failed"
}

src_install() {
    emake DESTDIR="${D}" install || die "install failed"

dodoc doc/trng.pdf
}
