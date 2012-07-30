# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils flag-o-matic

DESCRIPTION="Scientific program aimed at the ab initio virtual experimentation on a hopefully ever-increasing range of system types."
HOMEPAGE="http://www.tddft.org/programs/octopus/wiki/index.php/Main_Page"
SRC_URI="http://www.tddft.org/programs/octopus/download/${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE="mpi netcdf static"

DEPEND="
	sci-libs/fftw
	virtual/lapack
	virtual/blas
	sci-libs/gsl
	dev-lang/perl
	mpi? ( virtual/mpi )
	netcdf? ( sci-libs/netcdf )"
RDEPEND="${DEPEND}"

src_configure() {
	if use static ; then
		append-ldflags "-static"
	fi

	econf \
		--enable-shared \
		--enable-static \
		$(use_with mpi) \
		$(use_with netcdf) \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info
}

src_install() {
	emake install DESTDIR="${D}" || die "emake install failed"
	#dodoc AUTHORS NEWS README TODO
	#insinto /usr/share/doc/${PF}
	#if use examples; then
	#	doins -r examples || die "install examples failed"
	#fi
}

src_test() {
	emake check || die "emake check failed"
}
