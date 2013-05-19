# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit distutils
   
DESCRIPTION="Easy embedded Inline C for Python"
HOMEPAGE="http://ezpyinline.sf.net"
SRC_URI="http://cheeseshop.python.org/packages/source/e/ezpyinline/${P}.tar.gz"

LICENSE="Artistic"
KEYWORDS="~x86"
SLOT="0"
IUSE=""

DEPEND=">=dev-lang/python-2.3"
RDEPEND="${DEPEND}"

src_unpack() { 
    unpack ${A}
    cd "${S}"
}

src_install() {
    distutils_src_install
}

