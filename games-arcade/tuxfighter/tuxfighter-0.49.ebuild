# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

MY_P="TuxFighter49"
DESCRIPTION="A side scrolling shooter game starring a steamboat on the sea."
HOMEPAGE="http://funnyboat.sourceforge.net/"
SRC_URI="mirror://sourceforge/pygamebook/${MY_P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-python/pygame-1.7"

S=${WORKDIR}

src_unpack() {
	unpack ${A}
	echo '#!/bin/bash' > "${PN}"
	echo "cd ${GAMES_DATADIR}/${PN}" >> "${PN}"
	echo 'python TuxFighter49.py' >> "${PN}"
	chmod a+x "${PN}"
}

src_install() {
	dogamesbin "${PN}" || die "dogamesbin failed"
	insinto "${GAMES_DATADIR}/${PN}"
	doins -r data TuxFighter49.py || die "doins failed"
	dodoc readme.txt || die "dodoc failed"
	mv data/kiste.png "${PN}.png"
	doicon "${PN}.png" || die "doicon failed"
	make_desktop_entry "${PN}" "Tux Fighter" "${PN}.png"
	prepgamesdirs
}

