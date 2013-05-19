# Copyright 1999-2006 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Bindings to RXP, validating XML parser libary."
SRC_URI="http://www.reportlab.org/daily/${P}-daily-unix.tgz"
HOMEPAGE="http://www.reportlab.org/pyrxp.html"
DEPEND="virtual/python"
IUSE=""
SLOT="0"
LICENSE="as-is"
KEYWORDS="~x86"
S=${WORKDIR}

DEPEND="virtual/python"

src_unpack() {
	unpack ${A} || die "unpack failed"

	# daily updates are placed in a directory containing the archive
	# creation date; we need to extract this and use it to create $S
	local MOD_DATE=`ls --full-time ${DISTDIR}/${A} | cut --delimiter=" " --fields=7`
	local FILE_SUFFIX=`date --date=${MOD_DATE} +%Y%m%d`
	MY_S="${S}/${P}-${FILE_SUFFIX}/${PN}"
}

src_compile() {
	cd ${MY_S} || die "cd ${MY_S} failed"

	distutils_src_compile
}

src_install() {
	cd ${MY_S} || die "cd ${MY_S} failed"

	distutils_src_install
	dodir /usr/share/doc/${P}
	cp -r examples docs/* ${D}/usr/share/doc/${P}
	dodir /usr/share/${PN}
	cp -r test ${D}/usr/share/${PN}
	dodoc README
}
