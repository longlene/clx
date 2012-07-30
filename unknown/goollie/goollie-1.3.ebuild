# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils games cmake-utils

MY_PN="${PN/goo/GoO}"

DESCRIPTION="Ollie the Oligocheata is a worm on a mission"
HOMEPAGE="http://www.tweeler.com/index.php?PAGE=goollie_linux"
SRC_URI="http://www.tweeler.com/${MY_PN}_${PV}_src.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RDEPEND="virtual/opengl
	x11-libs/libX11
	x11-libs/libXext
	media-libs/libsdl
	virtual/glu
	media-gfx/imagemagick
	media-libs/sdl-mixer
	dev-games/libtuxcap"
DEPEND="${RDEPEND}
	dev-util/cmake"


S="${WORKDIR}/${MY_PN}_${PV}_src"

src_prepare(){
	sed -i "s:libtuxcap.so.4.0:-ltuxcap:" src/CMakeLists.txt || die
}

src_install(){
	newgamesbin ${CMAKE_BUILD_DIR}/${MY_PN} ${PN} || die "newgamesbin failed"
	insinto ${GAMES_DATADIR}/${PN}
	doins -r data/* src/*.py || die "doins failed"
#	doins src/*.py || die "doins failed"
	dodoc README || die "dodoc failed"
	prepgamesdirs		
}
