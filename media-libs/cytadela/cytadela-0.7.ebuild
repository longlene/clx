# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

DESCRIPTION="A conversion of an Amiga first person shooter"
HOMEPAGE="http://cytadela.sf.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="media-libs/libsdl
	media-libs/sdl-mixer
	virtual/opengl
	virtual/glu"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	einstall || die "einstall failed"
	insinto /usr/share/pixmaps
	doins data/icons/cytadela.xpm
	dodoc AUTHORS ChangeLog INSTALL NEWS README  data/doc/*
	insinto "${GAMES_BINDIR}"
	doins src/cytadela
	prepgamesdirs
}
