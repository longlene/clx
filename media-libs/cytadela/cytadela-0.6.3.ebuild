# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

DESCRIPTION="A conversion of an Amiga first person shooter."
HOMEPAGE="http://cytadela.sf.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}-src.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="media-libs/libsdl
	media-libs/sdl-mixer
	virtual/opengl
	virtual/glu"

S="${WORKDIR}"/${P}-src

src_install() {
	dodoc AUTHORS ChangeLog NEWS
	emake DESTDIR="${D}" install || die "install failed"

	prepgamesdirs
}
