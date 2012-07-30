# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/potrace/potrace-1.7.ebuild,v 1.8 2005/10/29 17:32:10 grobian Exp $

DESCRIPTION="Transforming bitmaps into vector graphics"
HOMEPAGE="http://potrace.sourceforge.net/"
SRC_URI="http://potrace.sourceforge.net/download/${P}.tar.gz"

LICENSE="GPL-2"

SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc ~ppc-macos sparc x86"

IUSE="zlib"

DEPEND="zlib? ( sys-libs/zlib )"

src_compile() {
	econf $(use_enable zlib) --enable-a4 || die "econf failed."
	emake || die "emake failed"
}

src_install() {
	make DESTDIR=${D} install || die "make install failed."
	insinto  /usr
	dolib src/libpotrace.a
	insinto /usr/include
	doins src/potracelib.h
	dodoc AUTHORS NEWS README
}
