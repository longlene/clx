# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils versionator games

BASE_PV="13"
MY_PV=$(delete_all_version_separators)
MOD="quess"
M="http://www.quaketerminus.com/mods"

DESCRIPTION="Quake 1 chess"
HOMEPAGE="http://retroquake.planetquake.gamespy.com/blog/?p=175"
SRC_URI="${M}/${MOD}${BASE_PV}.zip
	${M}/${MOD}${MY_PV}.zip"

# See readme.txt
LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

# Needs the CD data
RDEPEND="games-fps/quake1-data
	games-fps/darkplaces"
DEPEND="app-arch/unzip"

S=${WORKDIR}
dir=${GAMES_DATADIR}/quake1/${MOD}

src_unpack() {
	unpack ${A}

	rm *.{BAT,dat}

	# Make filenames lower-case
	for i in $(ls) ; do
		mv $i $(echo $i | tr '[A-Z]' '[a-z]')
	done
}

src_install() {
	insinto "${dir}"
	doins *.{dat,pak} || die "doins failed"

	# Wrapper for darkplaces engine. Will probably work with other engines.
	games_make_wrapper darkplaces-${MOD} "darkplaces -game ${MOD} +teamplay 0"
	make_desktop_entry darkplaces-${MOD} "Dark Places (Quess)" darkplaces.png

	dodoc *.txt

	prepgamesdirs
}