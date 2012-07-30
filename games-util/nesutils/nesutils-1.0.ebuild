# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games
DESCRIPTION="Utilities for messing with ROMs in the .NES format"
HOMEPAGE="http://www.raphnet.net/electronique/nes_cart/nes_cart_en.php"
SRC_URI="http://www.raphnet.net/electronique/nes_cart/nesutils-${PV}.tar.gz"
LICENSE="public-domain"
SLOT="0"
KEYWORDS="~x86"

IUSE=""
DEPEND="app-arch/gzip"
RDEPEND=""

src_compile() {
	emake CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" || die "emake failed"
}

src_install() {
	mkdir -p ${D}/usr/games/bin
	cp patchnes ${D}/usr/games/bin/patchnes
	cp readnes ${D}/usr/games/bin/readnes
	cp nesgg ${D}/usr/games/bin/nesgg
	dodoc README
}
