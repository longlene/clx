# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit eutils games

DESCRIPTION="Decode the secrets within as you discover a true sense"
HOMEPAGE="http://www.wegroup.org/games/hidden-object/between-the-worlds.html"
SRC_URI="http://www.wegroup.org/downloads/${P}.tar.bz2"
LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="sound"

GAMESDIR=${GAMES_PREFIX_OPT}/${PN}
QA_PRESTRIPPED="${GAMESDIR:1}/uspy"

RESTRICT="strip"

RDEPEND="x86? (
		sound? ( media-libs/sdl-mixer[vorbis] )
		media-libs/sdl-image[jpeg,png]
		media-libs/libsdl[X,opengl]
		sys-libs/zlib
	)
	amd64? (
		app-emulation/emul-linux-x86-sdl
		app-emulation/emul-linux-x86-xlibs
		app-emulation/emul-linux-x86-baselibs
	)"

S=${WORKDIR}/${PN}

src_install() {
	insinto ${GAMESDIR}
	doins -r snd/ uspy0.pak || die "doins failed"

	newicon icons/ico-32x32.png ${PN}.png

	exeinto ${GAMESDIR}
	doexe uspy || die "doexe failed"

	games_make_wrapper ${PN} "./uspy" ${GAMESDIR}
	make_desktop_entry ${PN} "Between the Worlds" ${PN}.png
	prepgamesdirs
}

