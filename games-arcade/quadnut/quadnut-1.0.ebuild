# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

DESCRIPTION="A OpenGL/SDL clone of Quadnet, a very addictive Asteroids-like game."
HOMEPAGE="http://luke.no-ip.org/code"
SRC_URI="http://luke.no-ip.org/code/downloads/${PN}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
S="${WORKDIR}/${PN}"

DEPEND="media-libs/sdl-mixer
		media-libs/sdl-ttf"

src_unpack() {
	unpack ${A}
	cd "${S}"
	
	sed -i 's#quadnut.cpp -lGL#quadnut.cpp ${GENTOO_CFLAGS} -lGL#' Makefile
}

src_compile() {
	make DESTDIR=${D} GENTOO_CFLAGS="${CFLAGS}" all || die "make failed."
}

src_install() {
	insinto ${GAMES_DATADIR}/${PN}
	doins *.ttf *.wav quadnut
	fperms 750 ${GAMES_DATADIR}/${PN}/quadnut

	local dir="${GAMES_DATADIR}/${PN}"
	games_make_wrapper ${PN} "./${PN}" "${dir}"
	
	prepgamesdirs
}
