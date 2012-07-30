# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-puzzle/einstein/einstein-2.0.ebuild,v 1.5 2007/02/03 14:02:12 blubb Exp $

inherit eutils games

DESCRIPTION="A free cross-platform pipe connecting game"
HOMEPAGE="http://home.gna.org/vodovod/"
SRC_URI="http://download.gna.org/vodovod/${P}-src.tar.gz"

S="${WORKDIR}/${P}-src"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND="media-libs/libsdl
		media-libs/sdl-mixer
		media-libs/sdl-image"

src_unpack() {
	unpack ${A}
	cd "${S}"
	for i in *.cpp; do
		sed -i 's:"\(data/[^"]*\)":"'${GAMES_DATADIR}'/'${PN}'/\1":g' $i
	done
}

src_install() {
	dogamesbin "${PN}" || die "dogamesbin failed"
	insinto "${GAMES_DATADIR}/${PN}/data"
	doins data/* || die "doins failed"
	#doicon ${DISTDIR}/${PN}.png
	make_desktop_entry ${PN} "Vodovod"
	prepgamesdirs
}
