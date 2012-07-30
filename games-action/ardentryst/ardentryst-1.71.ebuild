# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

MY_P=${P/-/}

DESCRIPTION="An action/RPG sidescoller, focused not just on fighting, but on story and character development."
HOMEPAGE="http://jordan.trudgett.com/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/pygame"

S=${WORKDIR}/${MY_P}

src_install() {
	insinto "${GAMES_DATADIR}/${PN}"
	doins -r Base Data Demos Fonts Levels Music Sounds OPR.txt *.py *.dig *.xml || die "doins failed"
	games_make_wrapper ${PN} "python ./ardentryst.py" "${GAMES_DATADIR}/${PN}"
	newicon Data/icon.png ${PN}.png
	make_desktop_entry ${PN} Ardentryst
	dodoc help.txt
	prepgamesdirs
}
