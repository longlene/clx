# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="System error description utility"
HOMEPAGE="http://strerror.sourceforge.net/"
SRC_URI="mirror://sourceforge/strerror/${P}.tar.bz2"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=sys-devel/binutils-2.18"

src_compile() {
	econf --disable-strip --enable-cflags \
		|| die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
