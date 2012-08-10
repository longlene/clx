# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: ranger Exp $

EAPI="4"

DESCRIPTION="${PN}"
HOMEPAGE="http://gsgd.co.uk/sandbox/jquery/easing/"
SRC_URI="http://gsgd.co.uk/sandbox/jquery/easing/jquery.easing.1.3.js -> ${P}.js"

IUSE=""
LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND=""
RDEPEND="js-libs/jquery"

src_install() {
	mkdir -p ${D}/usr/share/tablesorter/themes
	cp ${WORKDIR}/jquery.tablesorter.js ${D}/usr/share/tablesorter/
	cp -r ${WORKDIR}/themes/* ${D}/usr/share/tablesorter/themes/
}
