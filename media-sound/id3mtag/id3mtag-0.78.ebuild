# Copyright 1999-2006 Christian Faulhammer
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="command line utility for batch processing of id3 tags"
HOMEPAGE="http://home.wanadoo.nl/squell/id3.html"
SRC_URI="http://home.wanadoo.nl/squell/files/id3-${PV}.tar.gz"

LICENSE="as-is"
SLOT="0"
S=${WORKDIR}/id3-${PV}
KEYWORDS="alpha amd64 sparc x86"

src_compile() {
	cd "${S}"
	make prefix=${D}/usr CFLAGS="${CFLAGS}"|| die
}

src_install() {
	cd "${S}"
	make install prefix=${D}/usr || die
	dodoc README COPYING CHANGES INSTALL
}
