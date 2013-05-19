# Copyright 2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit distutils

SRC_URI="http://geosci.uchicago.edu/csc/numptr/${P}.tar.gz"
DESCRIPTION="NumPtr was developed to make it possible to work with SWIG'ed C or Fortran climate codes from Python. This package is also a good example of how to write C extensions for Python that manipulate arrays. "
HOMEPAGE="http://geosci.uchicago.edu/csc/numptr/index.html"
LICENSE="GPL-2"

SLOT="0"
IUSE=""
KEYWORDS="~x86"
S="${WORKDIR}/${P}"

# gcc must be built with USE=f77 or atlas will fail!
DEPEND=">=dev-lang/python-2.2*
		>=dev-lang/swig-1.3*"

src_install() {
	cd ${S}
	distutils_src_install
}

pkg_postinst() {
	distutils_pkg_postinst
}
