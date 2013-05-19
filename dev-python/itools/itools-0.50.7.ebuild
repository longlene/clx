# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

NEED_PYTHON=2.5.2
DESCRIPTION="Itools is a Python library which provides a wide range of
capabilities"
HOMEPAGE="http://hforge.org/itools"
SRC_URI="http://download.hforge.org/itools/0.50/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="pdf"

DEPEND=">=dev-libs/glib-2.12
    >=dev-libs/xapian-1.0.7
	>=dev-libs/xapian-bindings-1.0.7
	pdf? ( >=dev-python/reportlab-2.2 )"
RDEPEND=""

src_unpack() {
	unpack ${A}
}

src_compile() {
	distutils_src_compile
}

src_install() {
	distutils_src_install
}
