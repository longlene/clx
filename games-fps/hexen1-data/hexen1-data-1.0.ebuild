# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

DESCRIPTION="Hexen 1 data files"
HOMEPAGE="http://www.ravensoft.com/"
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
	export CDROM_NAME_SET=("Existing Install" "Hexen CD")
	cdrom_get_cds hexen.wad:hexen/hexen.wad

	if [[ $CDROM_SET -ne 0 && $CDROM_SET -ne 1 ]] ; then
		die "Error locating data files.";
	fi
}

src_install() {
	local WADPATH

	case ${CDROM_SET} in
		0) WADPATH = "";;
		1) WADPATH = "hexen/";;
	esac

	dodir ${GAMES_DATADIR}/doom-data
	insinto ${GAMES_DATADIR}/doom-data

	doins $CDROM_ROOT/$WADPATH/hexen.wad || die "Error installing hexen.wad.";

	prepgamesdirs
}
