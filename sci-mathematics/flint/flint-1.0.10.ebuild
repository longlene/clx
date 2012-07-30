# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils flag-o-matic

DESCRIPTION="Fast Library for Number Theory"
HOMEPAGE="http://www.flintlib.org/"
SRC_URI="http://www.flintlib.org/${P}.tar.gz"

RESTRICT="mirror"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 hppa ~mips ppc ~ppc64 ~sparc ~x86"
IUSE="qs"

DEPENDS="dev-libs/ntl
		dev-lang/python"
RDEPENDS="dev-lang/python"

src_unpack() {
	unpack ${A}
	cd ${S}
	sed -i s/"-shared -o libflint.so"/"-shared -Wl,-soname,libflint.so -o libflint.so"/ makefile
	sed -i s:"CFLAGS = \$(INCS) \$(FLINT_TUNE) -O3":" ": makefile
	sed -i s:"\$(CPP) \$(CFLAGS)":"\$(CPP) \$(CXXFLAGS)": makefile
}

src_compile() {
	FLINT_GMP_INCLUDE_DIR="/usr/include"
	FLINT_GMP_LIB_DIR="/usr/lib"
	FLINT_NTL_LIB_DIR="/usr/lib"
	FLINT_LINK_OPTIONS="${LDFLAGS}"
	FLINT_LIB="libflint.so"

	export FLINT_GMP_INCLUDE_DIR FLINT_GMP_LIB_DIR FLINT_NTL_LIB_DIR FLINT_LINK_OPTIONS FLINT_LIB

	append-flags "-funroll-loops"

	cd ${S}
	emake library || die "Building flint shared library failed!"

	if use qs ; then
		emake QS || die "Building flintQS failed!"
	fi
}

src_install(){
	newlib.so libflint.so libflint.so

	insinto /usr/include
	doins *.h

	if use qs ; then
		insinto /usr/bin
		doins mpQS
	fi

	insinto /usr/share/doc/${PF}
	doins doc/*.pdf || die "Failed to install pdf docs"
}