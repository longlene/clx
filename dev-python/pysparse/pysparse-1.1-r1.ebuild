# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils eutils

DESCRIPTION="PySparse adds a set of sparse matrix types holding double precision values to Python"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
HOMEPAGE="http://pysparse.sourceforge.net/index.html"

IUSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
LICENSE="as-is"

DEPEND="sci-libs/blas-atlas
	sci-libs/lapack-atlas
	dev-python/numpy"
RDEPEND=${DEPEND}

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}.patch"
}
