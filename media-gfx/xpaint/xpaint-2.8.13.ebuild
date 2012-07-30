# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/xpaint/xpaint-2.8.13.ebuild, $

inherit eutils

DESCRIPTION="XPaint image editor with tiff, jpeg and png support."
HOMEPAGE="http://sf-xpaint.sourceforge.net/"
SRC_URI="mirror://sourceforge/sf-xpaint/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="Xaw3d"

DEPEND=">=media-libs/tiff-3.2
	media-libs/jpeg
	media-libs/libpng
	sys-libs/zlib
	x11-libs/libXaw"

src_compile() {
	xmkmf -a || die
	make xaw || die
}

src_install() {
	make DESTDIR=${D} install || die
	make DESTDIR=${D} install.man || die
}
