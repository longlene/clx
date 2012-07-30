# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

inherit eutils games

DESCRIPTION="Syndicates of tomorrow those in control don't need uzis for back up"
HOMEPAGE="http://freesynd.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="media-libs/sdl-mixer"

S=${WORKDIR}/${PN}

src_unpack() {
	unpack ${A}
	cd ${S}/src
	sed -i 's:\-O2:${CXXFLAGS}:'	Makefile || die "sed failed"
	sed -i 's:\./data/:/usr/share/games/freesynd/:' file.cpp || die "sed failed"
}

src_compile() {
	cd ${S}/src
	emake	|| die "make failed"
}

src_install() {
	exeinto /usr/games/bin/
	doexe src/freesynd	|| die "doexe failed"
	insinto /usr/share/games/${PN}
	doins data/*
	dodoc README

	prepgamesdirs

	make_desktop_entry ${PN} "Free Syndicate"
}
