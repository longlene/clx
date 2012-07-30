# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

IUSE=""

DESCRIPTION="BEAST - the Bedevilled Sound Engine (ALSA plugin)"
HOMEPAGE="http://beast.gtk.org"
SRC_URI="ftp://beast.gtk.org/pub/beast/v0.7/${P}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="~x86"
SLOT="0"

RDEPEND=">=media-libs/alsa-lib-1.0.5
	=media-sound/beast-0.7.0"
DEPEND="dev-util/pkgconfig
	${RDEPEND}"

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS ChangeLog NEWS README
}
