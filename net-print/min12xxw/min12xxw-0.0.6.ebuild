# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit gnuconfig

DESCRIPTION="Driver for Minolta PagePro 1[23]xxW printers"
HOMEPAGE="http://www.hinterbergen.de/mala/min12xxw/"
SRC_URI="http://www.hinterbergen.de/mala/min12xxw/${P}.tar.gz"

SLOT="0"
IUSE=""
LICENSE="GPL-2"
KEYWORDS="x86 ~ppc ~alpha ~sparc ~hppa ~amd64"

src_unpack() {
	unpack ${A}
	cd ${S}
	gnuconfig_update
}

src_compile () {
	econf || die "econf failed"
	make || die "make failed"
}

src_install() {
	make DESTDIR=${D} install || die
}

pkg_postinst() {
	einfo "You will also need a PPD for Cups. You can get one at:"
	einfo "http://www.linuxprinting.org/show_driver.cgi?driver=min12xxw"
}
