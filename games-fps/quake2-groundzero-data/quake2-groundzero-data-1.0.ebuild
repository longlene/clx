# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils games

DESCRIPTION="Quake 2: Ground Zero data files"
HOMEPAGE="http://www.roguesoftware.com/"
SRC_URI=""

LICENSE="Q2GRNDZERO"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc videos"

# Depend on quake2-data, since many files from the original game are reused in this expansion
DEPEND="games-fps/quake2-data"
RDEPEND=""

S=${WORKDIR}

src_unpack() {
	export CDROM_NAME_SET=("Ground Zero CD")
	cdrom_get_cds Data/max/Rogue

	if [[ ${CDROM_SET} -ne 0 ]] ; then
		die "Error locating data files."
	fi
}

src_install() {
	dodir "${GAMES_DATADIR}"/quake2
	dodir "${GAMES_DATADIR}"/quake2/rogue

	if use doc ; then
		dodoc Data/all/docs/*
	fi

	if use videos ; then
		dodir "${GAMES_DATADIR}"/quake2/rogue/video
		insinto "${GAMES_DATADIR}"/quake2/rogue/video
		doins "${CDROM_ROOT}"/Data/max/Rogue/video/* || die "Error installing videos."
	fi

	insinto "${GAMES_DATADIR}"/quake2/rogue
	doins "${CDROM_ROOT}"/Data/all/pak0.pak || die "Error installing pak0.pak"

	prepgamesdirs
}

pkg_postinst() {
        games_pkg_postinst
        elog "This is only the data portion. You still need a full copy of"
	elog "Quake 2 and an appropriate client (see below) to play."
	elog "Appropriate clients may be found in the main Portage tree as"
	elog "games-fps/qudos, or in the Roslin overlay as games-fps/kmquake2"
	elog "The games-fps/quake2-icculus package in Portage is outdated, and"
	elog "may exhibit broken input, broken audio, or other unhappiness."
}
