# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
inherit eutils

DESCRIPTION="QT based Vypress Chat clone for X."
HOMEPAGE="http://trix.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${PN}-${PV}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 ~amd64"

DEPEND="=x11-libs/qt-3*"
RDEPEND="${DEPEND}"

src_unpack() {
    unpack ${A}
    cd "${S}"
}

src_compile() {
    econf || die "econf failed"
    emake || die "make failed"
}

src_install() {
    emake DESTDIR="${D}" install || die "make install failed"
    dodoc ChangeLog README AUTHORS TODO
}

pkg_postinst() {
        echo
	einfo "See ${HOMEPAGE} for more info."
        echo
}
