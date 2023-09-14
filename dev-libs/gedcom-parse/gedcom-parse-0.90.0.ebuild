# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="The Gedcom parser library"
HOMEPAGE="http://gedcom-parse.sourceforge.net/"
SRC_URI="mirror://sourceforge/gedcom-parse/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND=">=sys-libs/glibc-2.2"

src_compile() {
        econf || die "econf failed"
        emake || die "emake failed"
}

src_install() {
        make DESTDIR=${D} install || die
}
