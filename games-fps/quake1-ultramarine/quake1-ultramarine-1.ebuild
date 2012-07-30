# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

MOD="marine"
MY_PN="ultramarine"

DESCRIPTION="Gothic Quake 1 single-player map with new monsters"
HOMEPAGE="http://underworld.planetquake.gamespy.com/quakerev021102.html"
SRC_URI="http://www.quaddicted.com/filebase/${MOD}.zip"

# See ultramarine.txt
LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE="X"

# Needs the CD data
RDEPEND="games-fps/quake1-data
	X? ( games-fps/darkplaces )"
DEPEND="app-arch/unzip"

S=${WORKDIR}
dir=${GAMES_DATADIR}/quake1

src_install() {
	insinto "${dir}/${MOD}"
	doins "${MOD}"/*.pak || die "doins failed"

	if use X ; then
		# Wrapper for darkplaces engine
		games_make_wrapper darkplaces-${MY_PN} "darkplaces -game ${MOD} +map ${MOD}"
		make_desktop_entry darkplaces-${MY_PN} "Dark Places (Ultramarine)" darkplaces.png
	fi

	dodoc "${MOD}"/*.txt

	prepgamesdirs
}
