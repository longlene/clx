# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Unicode aware text to PostScript converter"
HOMEPAGE="http://www.gnome.gr.jp/~nakai/u2ps/"
SRC_URI="http://www.gnome.gr.jp/~nakai/u2ps/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="app-arch/bzip2
	virtual/libiconv
	>=dev-libs/glib-2.0.0
	>=gnome-base/libgnome-2.0.0
	>=gnome-base/libgnomeprint-2.5.4
	>=dev-libs/fribidi-0.10.4"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS ChangeLog NEWS README TODO
}
