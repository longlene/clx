# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

S="${WORKDIR}/${P}"

DESCRIPTION="PySparse extends the Python interpreter by a set of sparse matrix types holding double precision values/"
SRC_URI="mirror://sourceforge/pysparse/${P}.tar.gz"
HOMEPAGE="http://people.web.psi.ch/geus/pyfemax/"

IUSE=""
SLOT="0"
KEYWORDS="x86 ~ppc ~sparc ~alpha"
LICENSE="as-is"

# 2.1 gave sandbox violations see #21
DEPEND=">=dev-lang/python-2.2
        >=virtual/blas
        >=virtual/lapack
        >=dev-python/numeric-21.0"

src_unpack() {

	unpack ${P}.tar.gz
	cd ${S}
	patch < ${FILESDIR}/pysparse-0.33.029.patch

}



