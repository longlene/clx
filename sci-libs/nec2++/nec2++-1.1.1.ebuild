# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit flag-o-matic

MY_P="necpp"

DESCRIPTION="C++ version of the NEC2 antenna analysis program"
HOMEPAGE="http://www.si-list.org/swindex2.html#nec2pp"
SRC_URI="http://www.si-list.org/NEC_Archives/${MY_P}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc"

# nec2doc: user doc, mandatory for all NEC2 based ebuilds
DEPEND="sci-libs/blas
	sci-libs/lapack-atlas
	sys-devel/libtool
	sci-electronics/nec2doc"

S="${WORKDIR}/${MY_P}-${PV}"

src_unpack() {
	unpack ${A}
	sed -i -e 's/-llapack_atlas//' ${S}/src/Makefile.in || die "Sed failed"
}

src_compile() {
	# According to the doc, the program must be compiled with -O2.
	replace-flags -O3 -O2
	replace-flags -Os -O2
	econf || die "Configuration failed"
	emake || die "Compilation failed"
}

src_install() {
	dobin src/nec2diff src/nec2++ || die "Binaries installation failed"
	dolib src/libnecpp.a || die "Library installation failed"
	dodoc INSTALL COPYING AUTHORS README NEWS TODO || die "Doc installation failed"
	# Library documentation
	if use doc; then
	    dohtml -r html/* || die "Html doc installation failed"
	fi
	insinto /usr/share/doc/${PF}/example
	doins example/* || die "Examples installation failed"
	insinto /usr/share/doc/${PF}/test_data
	doins test_data/* || die "Test data installation failed"
}
