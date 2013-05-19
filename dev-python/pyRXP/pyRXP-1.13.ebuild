# Copyright 1999-2006 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Bindings to RXP, validating XML parser libary."
SRC_URI="http://www.reportlab.org/daily/${P}-daily-unix.tar.gz"
HOMEPAGE="http://www.reportlab.org/pyrxp.html"
DEPEND="virtual/python"
IUSE=""
SLOT="0"
LICENSE="as-is"
KEYWORDS="~x86 ~amd64"

DEPEND="virtual/python"

src_unpack() {
	unpack ${A} || die "unpack failed"
}

src_compile() {
	cd ${S} || die "cannot chdir to source"

	distutils_src_compile
}

src_install() {
	cd ${S} || die "cannot chdir to source"

	distutils_src_install
	dodir /usr/share/doc/${P}
	cp -r examples docs/* ${D}/usr/share/doc/${P}
	dodir /usr/share/${PN}
	cp -r test ${D}/usr/share/${PN}
	dodoc README
}
