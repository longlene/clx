# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils autotools games

DESCRIPTION="3D OpenGL moderately-strong chess engine"
HOMEPAGE="http://www.dreamchess.org/"
SRC_URI="mirror://berlios/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="virtual/opengl
	media-libs/libsdl
	media-libs/sdl-image"
DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"

	eautoreconf
}

src_compile() {
	econf \
		--datadir="${GAMES_DATADIR}" \
		--bindir="${GAMES_BINDIR}" \
		|| die "econf"

	emake || die "emake"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install"

	newicon data/icon.png ${PN}.png || die "newicon"
	make_desktop_entry ${PN} "DreamChess" ${PN}.png

	dodoc AUTHORS ChangeLog NEWS README

	prepgamesdirs
}
