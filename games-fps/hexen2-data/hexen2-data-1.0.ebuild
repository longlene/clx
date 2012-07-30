# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils games

DESCRIPTION="Hexen 2 data files"
# Grey Matter Interactive is the former Xatrix Entertainment
HOMEPAGE="http://www.gmistudios.com/"
SRC_URI=""

LICENSE="HEXEN2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
#client is required to use the data. none currently exist in portage. (uhexen (hammer of thyrion))
RDEPEND=""

S=${WORKDIR}

src_unpack() {
	export CDROM_NAME_SET=("Existing Install" "Hexen 2 CD")
	cdrom_get_cds pak0.pak:Install/Hexen2/data1/pak0.pak

	if [[ ${CDROM_SET} -ne 0 && ${CDROM_SET} -ne 1 ]] ; then
		die "Error locating data files."
	fi
}

src_install() {
	insinto ${GAMES_DATADIR}/hexen2/data1

	#hexen.rc, strings.txt, progs.dat, and progs2.dat are installed by uhexen2 (hammer of therion), so they aren't necessary.

	if [[ ${CDROM_SET} -eq 1 ]] ; then
		doins ${CDROM_ROOT}/Install/Hexen2/data1/pak0.pak || die "Error installing pak0.pak"
		doins ${CDROM_ROOT}/Install/Hexen2/data1/pak1.pak || die "Error installing pak1.pak"
	else
		doins ${CDROM_ROOT}/pak0.pak || die "Error installing pak0.pak"
		doins ${CDROM_ROOT}/pak1.pak || die "Error installing pak1.pak"
	fi

	prepgamesdirs
}
