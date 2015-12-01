# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="mpg123 replacement using gstreamer being able to play all file formats gstreamer understands"
HOMEPAGE="http://space.twc.de/~stefan/gst123.php"
SRC_URI="http://space.twc.de/~stefan/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="media-libs/gstreamer
	media-libs/gst-plugins-meta"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_configure() {
	econf
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS* README
}
