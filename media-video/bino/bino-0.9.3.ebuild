# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils

DESCRIPTION="Stereoscopic and multi-display media player"
HOMEPAGE="http://www.nongnu.org/bino/index.html"
SRC_URI="http://download.savannah.gnu.org/releases/${PN}/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=media-libs/glew-1.5.0
	media-libs/openal
	x11-libs/qt-gui:4
	x11-libs/qt-core:4
	x11-libs/qt-opengl:4
	>=media-libs/libass-0.9.9
	>=virtual/ffmpeg-0.6.90"

DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	# remove installed doc
	rm -rf "${D}/usr/share/doc/bino"

	# documentation
	dodoc AUTHORS ChangeLog INSTALL NEWS README doc/*.png doc/*.jpg
	dohtml doc/bino.html
	doman doc/bino.1
	doinfo doc/bino.info
}
