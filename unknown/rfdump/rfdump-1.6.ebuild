# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="tool to detect RFID-Tags and show their meta information"
HOMEPAGE="http://www.rfdump.org"
SRC_URI="http://www.rfdump.org/dl/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sys-libs/zlib
	>=x11-libs/gtk+-2.10.13
	>=x11-libs/pango-1.12.2
	>=media-libs/freetype-2.1.7
	>=media-libs/fontconfig-2.2.0
	>=media-libs/libpng-1.2.2
	gnome-base/libglade
	dev-libs/libxml2
	>=dev-libs/glib-2.12.3"

src_install() {
	emake DESTDIR="${D}" install || die "einstall failed"
	dodoc README NEWS TODO
}
