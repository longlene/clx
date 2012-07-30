# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/lzlib/lzlib-1.0_rc1.ebuild,v 1.1 2010/03/23 20:06:15 jasiu Exp $

EAPI="3"

inherit eutils

DESCRIPTION="LZMA compression and decompression functions library using lzip format"
HOMEPAGE="http://lzip.nongnu.org/lzlib.html"
MY_P=${P/_/-}
SRC_URI="mirror://nongnu/lzip/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S=${WORKDIR}/${MY_P}

src_configure() {
	sed -i "s/^\(CXXFLAGS='.*\)'$/\1 $CXXFLAGS'/" configure
	sed -i "s/= ldconfig/= echo ldconfig/" Makefile.in
	econf --enable-shared
}

src_compile() {
	emake || die
}

src_install() {
	emake install DESTDIR="${D}" || die
	rm -v ${D}/usr/lib*/liblz.a
	dodoc AUTHORS ChangeLog NEWS README
	cd ${D}/usr/lib*/ && ln -s liblz.so.? liblz.so || die
}
