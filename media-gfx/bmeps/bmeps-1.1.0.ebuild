# Copyright 1999-2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Convert PNG/JPEG/NetPBM to EPS"
HOMEPAGE="http://bmeps.sourceforge.net/"
SRC_URI="mirror://sourceforge/bmeps/${P}-a.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

IUSE="jpeg"

DEPEND="sys-libs/zlib
	media-libs/libpng
	jpeg? ( media-libs/jpeg )"



S=${WORKDIR}/${PN}

src_compile() {

	sed -i \
		-e "s:-lpnm -lppm -lpgm -lpbm:-lnetpbm:" configure || \
		die "sed configure failed"

	econf || die
	emake || die "emake failed"
}

src_install() {
	doman bmeps.1
	dobin bmeps
	dolib.a libbmeps.a

	insinto /usr/include
	doins bmeps.h pngeps.h

	dodoc DOCU/bmeps.pdf COPYING README
}
