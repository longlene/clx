# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit games cmake-utils mercurial

DESCRIPTION="A cross platform 3d action adventure"
HOMEPAGE="http://www.wolfire.com/lugaru"
SRC_URI=""
EHG_REPO_URI="http://hg.icculus.org/icculus/${PN}"

LICENSE="GPL-2 free-noncomm"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="media-libs/jpeg
	media-libs/libogg
	media-libs/libpng
	media-libs/libsdl
	media-libs/libvorbis
	media-libs/openal
	virtual/opengl"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}

src_prepare() {
	sed -i "s|:Data:|/${GAMES_DATADIR}/${PN}:Data:|g" Source/*.* || die
}

src_install() {
	insinto "${GAMES_DATADIR}"/${PN}
	doins -r Data || die
	dogamesbin ../${PN}_build/${PN} || die
	make_desktop_entry ${PN} "Lugaru: The Rabbit's Foot"
	prepgamesdirs
}
