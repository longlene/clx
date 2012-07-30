# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

IUSE=""

S=${WORKDIR}/omega-${PV}
DESCRIPTION="An application built on Xapian, consisting of indexers and a CGI search frontend."
SRC_URI="http://www.oligarchy.co.uk/xapian/${PV}/xapian-omega-${PV}.tar.gz"
HOMEPAGE="http://www.xapian.org/"
SLOT="0"
LICENSE="GPL-2"
RESTRICT="nomirror"
KEYWORDS="~amd64 ~x86"

DEPEND="virtual/libc
        sys-apps/gawk
        sys-apps/grep
        sys-apps/sed
        sys-devel/libtool
        sys-devel/gcc
        dev-libs/xapian"

RDEPEND="virtual/libc
         dev-libs/xapian"

S=${WORKDIR}/xapian-omega-${PV}

src_compile() {
        econf || die "./configure failed"
        emake || die
}

src_test() {
        make check || die "check failed"
}

src_install () {
        emake DESTDIR=${D} install || die

        #docs tly et installed under /usr/share/doc/xapian-core,
        # lets move them under /usr/share/doc..
        mv ${D}/usr/share/doc/xapian-omega ${D}/usr/share/doc/${PF}

        dodoc AUTHORS ChangeLog COPYING INSTALL NEWS README TODO
}
