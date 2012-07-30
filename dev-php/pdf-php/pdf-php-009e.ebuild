# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit php-lib-r1

DESCRIPTION="R&OS PHP PDF creation classes."
HOMEPAGE="http://www.ros.co.nz/pdf/"
LICENSE="public-domain"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

MY_P="pdfClassesAndFonts_${PV/_rc/-rc}"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.zip"
S="${WORKDIR}/${MY_P}"

RDEPEND="${RDEPEND}"

need_php_by_category

src_unpack() {
	# einfo unpack {$A} {$MY_P}
	# unpack {$A}
	# mkdir ${S}
	mkdir -p ${S}
	cd ${S}
	unpack ${A}
}

src_install() {

	cd ${S}

	# Handle the documentation
	local docs="data.txt readme.pdf readme.php ros.jpg"
	dodoc ${docs}

	# Handle the fonts directory
	mkdir -p ${D}/usr/lib/fonts
	chmod 755 ${D}/usr/lib/fonts
	cp -pP fonts/* ${D}/usr/lib/fonts
	chmod 644 ${D}/usr/lib/fonts/*

	# Handle the php class files.
	# class.ezpdf.php  class.pdf.php
	mkdir -p ${D}/usr/lib/php
	cp -pP class.ezpdf.php ${D}/usr/lib/php
	cp -pP class.pdf.php ${D}/usr/lib/php
	chmod 644 ${D}/usr/lib/php/class.pdf.php ${D}/usr/lib/php/class.ezpdf.php
}

