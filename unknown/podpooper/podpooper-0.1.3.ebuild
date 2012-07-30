# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils 

DESCRIPTION="An RSS 2.0 enclosure retriever"
SRC_URI="mirror://sourceforge/podpooper/${P}.tar.gz"
HOMEPAGE="http://sourceforge.net/projects/podpooper"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND=">=dev-lang/python-2.3.0"

src_install() {
	distutils_src_install
}
