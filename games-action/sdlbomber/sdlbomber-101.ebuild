# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-action/xbomber/xbomber-101.ebuild,v 1.13 2006/12/01 20:10:47 wolf31o2 Exp $

inherit eutils games

DESCRIPTION="Bomberman clone w/multiplayer support"
HOMEPAGE="http://www.linuxmotors.com/SDL_bomber/"
SRC_URI="http://www.linuxmotors.com/SDL_bomber/downloads/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc x86"
IUSE=""

DEPEND="x11-libs/libX11"
DEPEND="media-libs/sdl-sound"

src_unpack() {
	unpack ${A}
	cd "${S}"
	sed -i \
		-e "s:X386:X11R6:" Makefile \
		|| die "sed failed"
	sed -i \
		-e "s:data/%s:${GAMES_DATADIR}/${PN}/%s:" bomber.c \
		|| die "sed failed"
	sed -i \
		-e "s:=\"data\":=\"${GAMES_DATADIR}/${PN}\":" sound.c \
		|| die "sed failed"
}

src_compile() {
	emake CFLAGS="${CFLAGS}" || die "emake failed"
}

src_install() {
	dogamesbin matcher bomber || die "dogamesbin failed"
	insinto "${GAMES_DATADIR}"/${PN}
	doins -r data/* || die "doins failed"
	dodoc README Changelog
	prepgamesdirs
}
