# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Solver for large, sparse linear systems on parallel computers"
HOMEPAGE="http://www-unix.mcs.anl.gov/sumaa3d/BlockSolve/"
SRC_URI="ftp://ftp.mcs.anl.gov/pub/BlockSolve95/BlockSolve95.tar.Z"
LICENSE="petsc"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="debug doc"
RESTRICT="nomirror"
DEPEND="sci-ml/petsc"
S=${WORKDIR}/BlockSolve95

_BS_MPI_INCLUDE=/usr/include
_BS_MPI_LIB=/usr/lib/libmpi.a

pkg_setup() {
        einfo
        einfo "You may set BS_MPI_LIB and BS_MPI_INCLUDE to point to"
	einfo "the specific locations of your MPI installation files."
        einfo
	einfo "For example:"
        einfo "    $ export BS_MPI_LIB=/opt/mpich/e100/gnu/lib/libmpich.a"
        einfo "    $ export BS_MPI_INCLUDE=/opt/mpich/e100/gnu/include"
        einfo "    $ emerge blocksolve95"
        einfo

	[ ! -r ${BS_MPI_LIB:=${_BS_MPI_LIB}} ] && die "Could not find the MPI library. (Set BS_MPI_LIB.)"
	[ ! -d ${BS_MPI_INCLUDE:=${_BS_MPI_INCLUDE}} ] && die "Could not find the MPI inlude directory. (Set BS_MPI_INCLUDE)"

}

src_compile() {
	export BS_DIR="`pwd`"
	export PETSC_ARCH=linux

	local site="${S}/bmake/linux/linux.site"
	rm ${site}

	echo 'FC_LIB = ' >> ${site}
	echo 'BLAS_LIB = /usr/lib/blas/atlas/libblas.a' >> ${site}
	echo 'LAPACK_LIB = /usr/lib/lapack/atlas/liblapack.a' >> ${site}
	echo 'X11_INCLUDE = ' >> ${site}
	echo 'X11_LIB = ' >> ${site}
	echo "MPI_LIB = ${BS_MPI_LIB:=${_BS_MPI_LIB}}" >> ${site}
	echo "MPI_INCLUDE = -Dmpi -I${BS_MPI_INCLUDE:=${_BS_MPI_INCLUDE}}" >> ${site}
	echo 'MPIRUN = mpirun' >> ${site}
	echo 'BS_INCLUDE = $(PETSC_INCLUDE)' >> ${site}
	echo 'BS_LIB = $(BS_DIR)/lib/lib$(BOPT)/$(PETSC_ARCH)/libBS95.a' >> ${site}

	cat ${site}

	if use debug; then
		bopt=g
	else
		bopt=O
	fi

	make BOPT=${bopt} bslib || die
}

src_install() {
	dolib `find lib -name '*.a'`
	cd include
	insinto /usr/include/blocksolve95
	doins BMmsg.h BStree.h BSprivate.h BSsparse.h BSlog.h BSdepend.h BSmy_blas.h

	if use doc; then
		cd ${S}
		doman doc/man/man3/*.3
		doman doc/man/manh/*.h
	fi
}

pkg_postinst() {
	ewarn 
	ewarn "You must rebuild PETSc so that it uses BlockSolve95."
	ewarn
	ewarn "    $ emerge petsc"
	ewarn
}
