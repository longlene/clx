# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils
DESCRIPTION="a more flexible command line player in the spirit of ogg123 and mpg123, based on gstreamer"
HOMEPAGE="http://space.twc.de/~stefan/gst123.php"
SRC_URI="http://space.twc.de/~stefan/gst123/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="media-libs/gstreamer:0.10
	x11-libs/gtk+:2
	media-libs/gst-plugins-base:0.10
	x11-libs/libX11
	sys-libs/ncurses"
RDEPEND="${DEPEND}
	media-plugins/gst-plugins-meta:0.10"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog NEWS README TODO || die "dodoc failed"
}
