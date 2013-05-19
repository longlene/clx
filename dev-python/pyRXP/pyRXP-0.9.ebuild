# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

MY_P=${P/./-}
DESCRIPTION="Bindigs to RXP, validating XML parser libary."
SRC_URI="http://www.reportlab.org/ftp/${MY_P}.tgz"
HOMEPAGE="http://www.reportlab.org/pyrxp.html"
DEPEND="virtual/python"
IUSE=""
SLOT="0"
LICENSE="as-is"
KEYWORDS="~x86"
S=${WORKDIR}

DEPEND="virtual/python"

src_install() {
	distutils_src_install
	dodir /usr/share/doc/${P}
	cp -r examples docs/* ${D}/usr/share/doc/${P}
	dodir /usr/share/${PN}
	cp -r test ${D}/usr/share/${PN}
	dodoc README
}
