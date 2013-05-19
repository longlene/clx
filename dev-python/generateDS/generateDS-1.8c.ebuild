# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Generate Data Structures from XML Schema"
HOMEPAGE="http://www.rexx.com/~dkuhlman/generateDS.html"
SRC_URI="http://www.rexx.com/~dkuhlman/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="x86"
IUSE=""

DOCS="PKG-INFO README"

src_install() {
	distutils_src_install
	distutils_python_version	
	dohtml generateDS.html xsltvsgenerateds.*
	cp -r Demos tests ${D}/usr/share/doc/${PF}
	dobin generateDS.py
}
