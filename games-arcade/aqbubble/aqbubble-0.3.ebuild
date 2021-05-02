# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
inherit games

DESCRIPTION=""
HOMEPAGE="http://www.losersjuegos.com.ar/juegos/aqbubble"
SRC_URI="http://www.losersjuegos.com.ar/_media/juegos/${PN}/descargas/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

RDEPEND="media-libs/libsdl[X,audio,video]
	media-libs/sdl-mixer
	media-libs/sdl-image[png]
	nls? ( virtual/libiconv )"
DEPEND="${RDEPEND}
	nls? ( sys-devel/gettext )"

src_configure() {
	egamesconf \
		$(use_enable nls)
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog README
	prepgamesdirs
}
