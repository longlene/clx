# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit games

DESCRIPTION="Hexen II: Portal of Praevus game data files"
HOMEPAGE="http://www.ravensoft.com/gamesdetail.aspx?xmmid=624&xmid=14&xmview=2"
SRC_URI=""

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64 ~x86 ~ppc"
IUSE=""

DEPEND=""
RDEPEND=""

src_unpack() {
	cdrom_get_cds Install/Data/portals/pak3.pak

	einfo "Copying files from CD..."
	cp "${CD_ROOT}"/Install/Data/portals/pak3.pak . \
		|| die "copy pak3.pak failed"
}

src_install() {
	insinto "${GAMES_DATADIR}"/hexen2/portals
	doins pak3.pak || die "doins pak0.pak failed"
	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst
	elog "This is just the data portion of the game.  You also need to install"
	elog "a game engine, such as games-fps/uhexen2, to play the game."
}
