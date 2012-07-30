# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

MOD="masque"

DESCRIPTION="Masque of the Red Death - Quake 1 single-player map"
HOMEPAGE="http://tronyn.planetquake.gamespy.com/
	http://underworld.planetquake.gamespy.com/quakerev051101a.html"
SRC_URI="http://www.quaddicted.com/filebase/${MOD}.zip"

# See Masquereadme.txt
LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE="X"

# Needs the CD data and Scourge of Armagon mission pack
RDEPEND="games-fps/quake1-soa
	X? ( games-fps/darkplaces )"
DEPEND="app-arch/unzip"

S=${WORKDIR}
dir=${GAMES_DATADIR}/quake1

src_unpack() {
	unpack ${A}

	# Make filenames lower-case
	mv Pak0.PAK pak0.pak
}

src_install() {
	insinto "${dir}/${MOD}"
	doins *.pak || die "doins failed"

	if use X ; then
		# Wrapper for darkplaces engine
		games_make_wrapper darkplaces-${MOD} "darkplaces -hipnotic -game ${MOD} +map masquestart"
		make_desktop_entry darkplaces-${MOD} "Dark Places (Masque of the Red Death)" darkplaces.png
	fi

	dodoc *.txt

	prepgamesdirs
}
