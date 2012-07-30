# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Library for creating and manipulating (un)directed graphs."
HOMEPAGE="http://cneurocvs.rmki.kfki.hu/igraph/"
SRC_URI="http://cneurocvs.rmki.kfki.hu/${PN}/download/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+arpack +blas debug +gmp +graphml +lapack profile shell"

DEPEND="sys-devel/libtool
	graphml? ( dev-libs/libxml2 )
	gmp? ( dev-libs/gmp )
	blas? ( virtual/blas )
	lapack? ( virtual/lapack )
	arpack? ( sci-libs/arpack )"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
}

src_compile() {
	local myconf

	econf \
		$(use_enable graphml) \
		$(use_enable gmp) \
		$(use_enable shell) \
		$(use_enable profile profiling) \
		$(use_enable debug) \
		$(use_with blas external-blas) \
		$(use_with lapack external-lapack) \
		$(use_with arpack external-arpack) \
		|| die "configure failed"

	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die
}
