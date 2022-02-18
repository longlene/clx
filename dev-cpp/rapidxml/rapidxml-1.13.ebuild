# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Fast XML parser"
HOMEPAGE="http://rapidxml.sourceforge.net/index.htm"
SRC_URI="https://sourceforge.net/projects/rapidxml/files/rapidxml/rapidxml%20${PV}/${P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include/rapidxml
	doins {rapidxml,rapidxml_iterators,rapidxml_print,rapidxml_utils}.hpp
}
