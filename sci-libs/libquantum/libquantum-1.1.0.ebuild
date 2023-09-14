# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit eutils

DESCRIPTION="C library for quantum computing and quantum simulation"
HOMEPAGE="http://www.libquantum.de/"
SRC_URI="http://www.libquantum.de/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~sparc ~x86"
IUSE="+lapack quobtools"

DEPEND=">=sys-devel/gcc-2.95
lapack? ( virtual/lapack )"
RDEPEND="${DEPEND}"

src_compile() {
	econf $(use_with lapack)
	emake || die "emake failed"
	
	if use quobtools ; then
		emake quobtools	|| die "emake quobtools failed"
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed" 
	dodoc CHANGES README || die

	if use quobtools ; then
		emake DESTDIR="${D}" quobtools_install || die "emake quobtools_install failed"
	fi
}
