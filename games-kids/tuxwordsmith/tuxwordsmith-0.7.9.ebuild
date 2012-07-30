# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils python games

DESCRIPTION="Scrabble in over 50 languages"
HOMEPAGE="http://new.asymptopia.org/staticpages/index.php?page=TuxWordSmith"
SRC_URI="http://www.asymptopia.org/gentoo/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="dev-python/pygame
	dev-python/wxpython
        media-libs/libsdl
        media-libs/sdl-image
        media-libs/sdl-mixer"


src_install() {
        insinto /$(python_get_libdir)/site-packages
        doins -r TuxWordSmith
	exeinto ${GAMES_BINDIR}
        exeopts -m0755
        doexe tuxwordsmith
	dodir ${GAMES_STATEDIR}
        dodir ${GAMES_STATEDIR}/TuxWordSmith
        insinto ${GAMES_STATEDIR}/TuxWordSmith
        doins -r Font
        doins -r Globals
        doins -r xdxf
}

