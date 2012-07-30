# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

DESCRIPTION="A Minesweeper-like game written using the GTK-- toolkit."
SRC_URI="http://bombz-gtk.googlecode.com/files/${P}.tar.bz2"
HOMEPAGE="http://code.google.com/p/bombz-gtk/"
KEYWORDS="~x86 ~amd64"
SLOT="0"
LICENSE="GPL-3"
IUSE=""

DEPEND="dev-cpp/gtkmm"
S=${WORKDIR}/bombz-gtk

src_compile() {
	egamesconf || die "egamesconf failed"
	emake || die "emake failed"
}

src_install() {
	dogamesbin src/bombz-gtk || die "dogamesbin failed"

	insinto "${GAMES_DATADIR}"/bombz-gtk
	doins -r data/* || die "doins failed"
	dodoc README

	prepgamesdirs
}
