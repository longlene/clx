# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="Broken Sword 2: The Smoking Mirror (interactive demo)"
HOMEPAGE="http://www.revolution.co.uk/_display.php?id=15"
SRC_URI="http://files.5star-network.com/Games/${PN}.zip
	ftp://ftp.planetmirror.com/pub/gameworld/demos/${PN}.zip"

LICENSE="freedist"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT="strip"

RDEPEND=">=games-engines/scummvm-0.8.2"
DEPEND="app-arch/unzip"

S=${WORKDIR}
dir=${GAMES_DATADIR}/${PN}

src_install() {
	insinto "${dir}"
	doins *.{clu,CLU,inf,tab} || die "doins failed"

	games_make_wrapper ${PN} "scummvm -f -p \"${dir}\" sword2demo"
	make_desktop_entry ${PN} "Broken Sword 2 (Demo)"

	prepgamesdirs
}
