# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A C++-based object-oriented discrete event simulation."
HOMEPAGE="http://www.omnetpp.org/"
SRC_URI="http://www.omnetpp.org/download/release/${P}-src.tgz"

LICENSE="omnetpp"
SLOT="0"
KEYWORDS="~x86"
IUSE="examples"

DEPEND="=dev-lang/tcl-8.4*
	dev-lang/tk
	app-doc/doxygen
	sys-devel/bison
	dev-lang/perl
	dev-libs/libxslt
	virtual/ghostscript
	media-gfx/imagemagick
	media-gfx/graphviz"
RDEPEND="${DEPEND}"

src_compile() {
	export PATH="${PATH}:${S}/bin"
	export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${S}/lib"
	export TCL_LIBRARY="$ROOT/usr/lib/tcl8.4"
	econf || die 'econf failed'
	emake || die 'error: emake failed'
}

src_install() {
	rm -f bin/neddoc*
	dolib lib/*
	dobin bin/*
	dodoc doc/*
	insinto "/usr/share/doc/${P}/bitmaps"
	doins -r bitmaps/* || die "error: installing data failed"
	if use examples ; then
		insinto "/usr/share/doc/${P}/samples"
		doins -r samples/* || die "error: installing data failed"
		for x in $(find ./samples -executable -type f); do
			exeinto "/usr/share/doc/${P}/$(dirname ${x})"
			doexe "${x}"
		done;
	fi
}

pkg_postinst() {
	if use examples ; then
		echo ""
		einfo "In order to provide the samples"
		einfo "please copy them to a user home directory."
		einfo "The samples are located in:"
		einfo "   /usr/share/doc/${P}/samples"
		echo ""
	fi
}
