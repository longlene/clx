# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit games

DESCRIPTION="model-airplane flight simulation program"
HOMEPAGE="http://crrcsim.berlios.de/"
SRC_URI="http://download.berlios.de/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="portaudio"

RDEPEND="media-libs/libsdl
	virtual/glut
	media-libs/plib
	portaudio? ( media-libs/portaudio )"
DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die

	dodoc AUTHORS HISTORY NEWS README || die

	prepgamesdirs
}
