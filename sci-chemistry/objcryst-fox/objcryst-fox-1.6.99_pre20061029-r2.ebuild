# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils flag-o-matic toolchain-funcs


MY_P=Fox-20061029SVN
#S= ${WORKDIR}/${MY_P}
DESCRIPTION="ObjCryst++ : object-oriented Crystallographic Library, for the analysis of Crystal structures from scattering experiments: optimized scattering computation, Graphical interface for structures and data, global optimization algorithms"
HOMEPAGE="http://objcryst.sourceforge.net"
SRC_URI="mirror://sourceforge/objcryst/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc opt"

RDEPEND="x11-libs/gtk+
	x11-base/xorg-x11
	media-libs/mesa"

DEPEND="${RDEPEND}"

if use opt; then
	einfo "using optimized flags"
	replace-flags -O2 -O3
	append-flags -w -ffast-math -fstrict-aliasing -pipe -fomit-frame-pointer -funroll-loops
    if [ "`gcc-major-version`" -ge "4"  ]; then
		einfo "ading vectorisation because gcc-version>4"
		append-flags -ftree-vectorize
	fi
fi

src_compile() {
	cd "${WORKDIR}/${MY_P}"
    if use doc; then
		emake doc || "make doc failed"
	fi
    emake || die "make failed"
}

src_install() {
	cd "${WORKDIR}/${MY_P}"

	#install binary Fox
	dobin src/Fox

	#install doc
	if use doc; then
		dodoc README LICENSE ChangeLog 
		dohtml src-doc/*
	fi


	# Install the examples
	insinto /usr/share/${PF}/examples/
	doins -r example/*
}
