# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*:2.6:3.2"

inherit distutils eutils

DESCRIPTION="Python module that generates KML with as little effort as possible"
HOMEPAGE="http://code.google.com/p/simplekml/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

PYTHON_MODNAME="simplekml"

RESTRICT_PYTHON_ABIS="2.[45]"

src_install() {
	distutils_src_install
	newdoc README.txt README
}
