# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

DESCRIPTION="Hacx data files"
HOMEPAGE="http://www.sonic.net/~nostromo/hacx/Hacx.html"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
# a client is required to play the game. doomsday is the only one that plays hacx that is in portage atm.
RDEPEND="games-fps/doomsday"

S=${WORKDIR}

pkg_setup() {
	# the game is freeware and is available for download in some places, but not by direct-link. (that I could find)
	# the game was enver released commercially
	export CDROM_NAME_SET=("Existing Install")
	cdrom_get_cds hacx.wad

	if [[ ${CDROM_SET} -ne 0 ]] ; then
		die "Error locating data files. Visit the following URL for a link to download them: http://www.sonic.net/~nostromo/hacx/Hacx.html";
	fi
}

src_install() {
	dodir ${GAMES_DATADIR}/doom-data
	insinto ${GAMES_DATADIR}/doom-data

	doins ${CDROM_ROOT}/hacx.wad || die "Error installing hacx.wad.";
	doins ${CDROM_ROOT}/hacx.deh || die "Error installing hacx.deh.";

	prepgamesdirs
}
