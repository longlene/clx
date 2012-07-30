# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="iec16022 generates 2d datamatrix barcodes as used by Semapedia."
HOMEPAGE="http://www.datenfreihafen.org/projects/iec16022.html"
SRC_URI="http://www.datenfreihafen.org/~stefan/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-libs/popt-1.7-r1
		>=sys-libs/zlib-1.2.3"

src_install() {
	dodoc CHANGELOG CREDITS README TODO

	# We need to set prefix since this package cannot be ./configured
	make DESTDIR=${D} prefix=/usr install || die "Install failed!"
}
