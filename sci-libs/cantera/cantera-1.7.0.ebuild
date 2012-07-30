# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

inherit toolchain-funcs multilib flag-o-matic

DESCRIPTION="An Object-Oriented Software for Reacting Flows."
HOMEPAGE="http://www.cantera.org/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="blas fortran python"

DEPEND="blas? ( virtual/blas virtual/cblas virtual/lapack )
	fortran? ( dev-lang/f2c )
	python? ( dev-python/numeric )"

RDEPEND="${DEPEND}"
PREFIX="${D}"usr

src_compile() {
	if use blas ; then
		sed -i -e "s|#BLAS_LAPACK_LIBS'-llapack -lf77blas -lcblas -latlas'|BLAS_LAPACK_LIBS='-llapack -lblas -lcblas -latlas'|" \
		-e "s|#BLAS_LAPACK_DIR='/usr/lib'|BLAS_LAPACK_DIR='/usr/$(get_libdir)'|" "${S}"/preconfig || die
	fi

	if use fortran ; then
		sed -i -e 's|BUILD_F90_INTERFACE=${BUILD_F90_INTERFACE:="default"}|BUILD_F90_INTERFACE=${BUILD_F90_INTERFACE:="y"}|' "${S}"/preconfig || die
	else
		sed -i -e 's|BUILD_F90_INTERFACE=${BUILD_F90_INTERFACE:="default"}|BUILD_F90_INTERFACE=${BUILD_F90_INTERFACE:="n"}|' "${S}"/preconfig || die
	fi

	if use python ; then
		sed -i -e 's|PYTHON_PACKAGE=${PYTHON_PACKAGE:="default"}|PYTHON_PACKAGE=${PYTHON_PACKAGE:="full"}|' \
		-e 's|USE_NUMERIC=${USE_NUMERIC:="default"}|USE_NUMERIC=${USE_NUMERIC:="y"}|' "${S}"/preconfig || die
	else
		sed -i -e 's|PYTHON_PACKAGE=${PYTHON_PACKAGE:="default"}|PYTHON_PACKAGE=${PYTHON_PACKAGE:="none"}|' \
		-e 's|USE_NUMERIC=${USE_NUMERIC:="default"}|USE_NUMERIC=${USE_NUMERIC:="n"}|' "${S}"/preconfig || die
	fi

	sed -i -e "s|\"ar ruv\"|\"$(tc-getAR) ruv\"|" \
	-e "s|\"ranlib\"|\"$(tc-getRANLIB)\"|" \
	"${S}"/preconfig || die

	sed -i -e "s|ct_libdir=\\\${prefix}/lib|ct_libdir=\\\${prefix}/$(get_libdir)|" \
	-e "s|ct_datadir=\\\${prefix}/data|ct_datadir=\\\${prefix}/share/${PN}/data|" \
	-e "s|ct_demodir=\\\${prefix}/demos|ct_demodir=\\\${prefix}/share/${PN}/demos|" \
	-e "s|ct_templdir=\\\${prefix}/templates|ct_templdir=\\\${prefix}/share/${PN}/templates|" \
	-e "s|ct_tutdir=\\\${prefix}/tutorials|ct_tutdir=\\\${prefix}/share/${PN}/tutorials|" \
	-e "s|ct_docdir=\\\${prefix}/doc|ct_docdir=\\\${prefix}/share/${PN}/doc|" \
	-e "s|ct_mandir=\\\${prefix}|ct_mandir=\\\${prefix}/share/man|" \
	"${S}"/configure || die

	sed -i -e "s|cp -f \\\"@homedir@/setup_cantera\\\" \\\"@ct_bindir@\\\"||" \
	-e "s|rm -fR @ct_libdir@/\*||" "${S}"/Makefile.in

	append-flags -fPIC
	./preconfig --prefix=${PREFIX} || die "could not configure"

	sed -i -e "s|${PREFIX}/templates|${PREFIX}/share/${PN}/templates|" "${S}"/tools/Makefile || die
	sed -i -e "s|/lib/|/$(get_libdir)/|" "${S}"/tools/src/finish_install.py || die

	emake -j1 all || die "emake failed"
}

src_install() {
	emake DESTDIR=${D} install || die "could not install"
}
