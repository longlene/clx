# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Convert PNG/JPEG/NetPBM to EPS"
HOMEPAGE="http://bmeps.sourceforge.net/"
SRC_URI="mirror://sourceforge/bmeps/${P}.tar.gz"
LICENSE="LGPL-2"

KEYWORDS="~x86"
SLOT="0"
S=${WORKDIR}/${PN}

IUSE="jpeg"

DEPEND="sys-libs/zlib
	media-libs/libpng
	media-libs/jpeg
	media-libs/netpbm"

src_compile() {
	cd ${S}
	econf || die "econf failed"
	emake || die "Error compiling bmeps executable"

}

src_install () {
	doman man/man1/bmeps.1
	dobin bmeps
	dolib.a libbmeps.a

	insinto /usr/include
	doins bmeps.h pngeps.h

	dodoc DOCU/bmeps.pdf README

}

