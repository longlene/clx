# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

DESCRIPTION="simple futuristic racing game"
HOMEPAGE="http://raum1.memebot.com/enemylines/enemylines3.html"
SRC_URI="http://raum1.memebot.com/enemylines/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="media-libs/libsdl"

src_install() {
	dogamesbin "${PN}" || die "failed"
	dodoc README
	prepgamesdirs
}
