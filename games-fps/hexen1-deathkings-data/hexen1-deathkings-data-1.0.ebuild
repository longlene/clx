# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils games

DESCRIPTION="Hexen 1: Deathkings of the Dark Citadel data files"
HOMEPAGE="http://www.ravensoft.com/"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

S=${WORKDIR}

pkg_setup() {
	# Don't know the file path on the CD. I have the CD, but its shrink wrapped :-)
	export CDROM_NAME_SET=("Existing Install")
	cdrom_get_cds hexdd.wad

	if [[ $CDROM_SET -ne 0 ]] ; then
		die "Error locating data files.";
	fi
}

src_install() {
	local WADPATH

	dodir ${GAMES_DATADIR}/doom-data
	insinto ${GAMES_DATADIR}/doom-data

	doins $CDROM_ROOT/$WADPATH/hexdd.wad || die "Error installing hexdd.wad.";

	prepgamesdirs
}
