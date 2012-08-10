# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $

EAPI="4"

DESCRIPTION="tablesorter"
HOMEPAGE="http://tablesorter.com/"
SRC_URI="http://tablesorter.com/__jquery.tablesorter.zip -> ${P}.zip"

IUSE=""
LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="app-arch/unzip"
RDEPEND=">=js-libs/jquery-1.2.1"

S=${WORKDIR}

src_unpack() {
	unpack "${A}"
	find -name .svn | xargs rm -fr
}

src_install() {
	mkdir -p ${D}/usr/share/tablesorter/themes
	cp ${WORKDIR}/jquery.tablesorter.js ${D}/usr/share/tablesorter/
	cp -r ${WORKDIR}/themes/* ${D}/usr/share/tablesorter/themes/
}
