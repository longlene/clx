# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

DESCRIPTION="Cockroaches invade your screen"
HOMEPAGE="http://xcockroach.free.fr/"
SRC_URI="http://xcockroach.free.fr/archives/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
RESTRICT="nomirror"

IUSE=""
DEPEND=""

src_unpack() {
	unpack ${A}
	cd ${S}
	sed -i -e '/pixmapdir/ s/$(datadir)/\/usr\/share/' Makefile.am
	sed -i -e '/PIXMAPDIR/ s/$(datadir)/\/usr\/share/' src/Makefile.am
	if use amd64; then
		sed -i -e 's/-Wall/-Wall -fPIC/' src/behaviors/Makefile.am
		sed -i -e 's/-Wall/-Wall -fPIC/' src/behaviors/Makefile.in
	fi
}

src_compile() {
	egamesconf || die "egamesconf failed"
	emake || die "emake failed"
}

src_install() {
	dogamesbin src/xcockroach || die "dogamesbin failed"
	doicon xcockroach.png
	insinto "${GAMES_DATADIR}/${PN}"
	doins -r themes || die "doins failed"
	insinto "${GAMES_DATADIR}/pixmaps"
	doins xcockroach.png
	insinto "${GAMES_DATADIR}/${PN}/behaviors"
	doins -r src/behaviors/*.so || die "doins failed"
	dodoc AUTHORS ChangeLog COPYING NEWS README TODO
	prepgamesdirs
}
