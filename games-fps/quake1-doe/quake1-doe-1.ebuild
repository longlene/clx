# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils games

DESCRIPTION="Dissolution of Eternity mission pack for Quake 1"
HOMEPAGE="http://www.idsoftware.com/games/quake/quake-mp1/"
SRC_URI=""

# See manual.txt
LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="X"

DEPEND=""
RDEPEND="games-fps/quake1-data
	X? ( || (
		games-fps/darkplaces
		games-fps/joequake
		games-fps/tenebrae
		games-fps/ezquake-bin
		games-fps/fuhquake-bin ) )"

S=${WORKDIR}

pkg_setup() {
	games_pkg_setup

	# need to checksum the pak0.pak file in order to implement an "Existing Install" option.

	export CDROM_NAME_SET=("The Offering CD" "Dissolution of Eternity CD")

	# second cdrom_get_cds path may not be the correct letter-case. I do not own this CD to verify.
	cdrom_get_cds Eternity/ROGUE/PAK0.PAK:Rogue/pak0.pak

	if [[ "$CDROM_SET" -ne 0 && "$CDROM_SET" -ne 1 ]] ; then
		die "Error locating data files.";
	fi
}

src_install() {
	insinto "${GAMES_DATADIR}"/quake1/rogue

	newins "${CDROM_ROOT}/${CDROM_MATCH}" pak0.pak || die "Error installing pak0.pak."

	if [[ "$CDROM_SET" -eq 0 ]] ; then
		dodoc "${CDROM_ROOT}"/license.txt || die "Error installing documentation file licence.txt"
		dodoc "${CDROM_ROOT}"/eternity/readme.txt || die "Error installing documentation file readme.txt"
	else
		# Not sure of file names, I don't have this CD!
		dodoc "${CDROM_ROOT}"/*.txt || die "Error installing documentation."
	fi

	prepgamesdirs
}
