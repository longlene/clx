# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils autotools subversion

ESVN_REPO_URI="https://gpstk.svn.sourceforge.net/svnroot/gpstk/dev"

DESCRIPTION="The goal of the GPSTk project is to provide an open source library and suite of applications to the satellite navigation community--to free researchers to focus on research, not lower level coding"
HOMEPAGE="http://www.gpstk.org/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE="doc"

RESTRICT="test"

DEPEND="doc? ( app-doc/doxygen )
	!sci-geosciences/gpstk-bin"

src_unpack() {
        subversion_src_unpack
        cd "${S}"

	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS NEWS README || die "dodoc failed"

	if use doc; then
		doxygen || die "doxygen failed"
	fi
}
