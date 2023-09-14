# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

DESCRIPTION="LeChuck's Revenge: Monkey Island 2 (interactive demo)"
HOMEPAGE="http://www.worldofmi.com/thegames/monkey2/"
SRC_URI="http://gentooexperimental.org/~unlord/${PN}.zip"

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
	doins MI2DEMO.{000,001,002} DEMO.REC || die "doins failed"

	games_make_wrapper ${PN} "scummvm -f -p \"${dir}\" monkey2"
	doicon ${FILESDIR}/${PN}.png || die "doicon failed"
	make_desktop_entry ${PN} "LeChuck's Revenge: Monkey Island 2 (Demo)" ${PN}.png

	prepgamesdirs
}
