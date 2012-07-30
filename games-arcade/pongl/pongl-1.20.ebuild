# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

MY_PN=PonGL
DESCRIPTION="Remake of Pong with 3D design and oldstyle 2D gameplay"
HOMEPAGE="http://xc-lan.be/pongl/telechargement.php"
SRC_URI="http://audio.ovh.net/xclan/${MY_PN}/${MY_PN}-src.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="media-libs/mesa
	media-libs/sdl-mixer"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${MY_PN}

src_unpack() {
	unpack ${A}
	cd ${S}
	sed -i -e 's:\-Wall:${CFLAGS}:' Makefile || die "sed failed"
	sed -i -e 's:\"data\/:\"\/usr\/share\/games\/pongl\/:' *.c || die "sed failed"
}

src_install() {
	dogamesbin ${MY_PN}	|| die "dogamesbin failed"
	insinto "${GAMES_DATADIR}/${PN}"
	doins -r data/*	|| die "doins failed"
	
	newicon ${MY_PN}.ico ${MY_PN}.png
	dodoc AUTHORS INSTALL

	make_desktop_entry ${MY_PN} "${MY_PN}"  PonGL.png
	prepgamesdirs
}

