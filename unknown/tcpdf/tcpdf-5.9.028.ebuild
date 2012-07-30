# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

inherit php-lib-r1

KEYWORDS="amd64 x86"

MY_P=${PN}_${PV//./_}

DESCRIPTION="TCPDF is a FLOSS PHP class for generating PDF documents."
HOMEPAGE="http://www.tcpdf.org/"
SRC_URI="mirror://sourceforge/tcpdf/${MY_P}.zip"
LICENSE="LGPL-3.0"
SLOT="0"
IUSE="examples"

need_php_by_category

S="${WORKDIR}/${PN}"

src_install() {
	php-lib-r1_src_install . *.php tcpdf.*
	php-lib-r1_src_install . `find ./config -type f -print`
	php-lib-r1_src_install . `find ./images -type f -print`
	php-lib-r1_src_install . `find ./fonts -maxdepth 1 -type f -print`
	php-lib-r1_src_install . `find ./cache -type f -print`

	dodoc-php CHANGELOG.TXT LICENSE.TXT README.TXT

	dohtml -r doc

        if use examples; then
                insinto /usr/share/doc/${PF}/examples
                doins -r examples/*
        fi

}
