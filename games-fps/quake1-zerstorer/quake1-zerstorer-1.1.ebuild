# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils versionator games

MOD="zer"
MY_PV=$(delete_all_version_separators)
# Has "oe" in directory names, just to be confusing
M="ftp://ftp.planetmirror.com/pub/idgames2/partial_conversions/zerstoerer"
B="ftp://ftp.fu-berlin.de/pc/games/idgames2/partial_conversions/zerstoerer"
Q="http://www.quaddicted.com/filebase"
G="http://www.gamers.org/pub/idgames2/partial_conversions/zerstoerer"

DESCRIPTION="Story-driven Quake 1 campaign with new weapons and monsters"
HOMEPAGE="http://shotgun1.shackspace.com/"
SRC_URI="${M}/${MOD}dem.zip
	${B}/${MOD}dem.zip
	${Q}/${MOD}dem.zip
	${G}/${MOD}dem.zip
	${M}/${MOD}.zip
	${B}/${MOD}.zip
	${Q}/${MOD}.zip
	${G}/${MOD}.zip
	${M}/${MOD}${MY_PV}.zip
	${B}/${MOD}${MY_PV}.zip
	${Q}/${MOD}${MY_PV}.zip
	${G}/${MOD}${MY_PV}.zip"

# See zer.txt
LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

# Needs the CD data
RDEPEND="games-fps/quake1-data
	games-fps/darkplaces"
DEPEND="app-arch/unzip"

S=${WORKDIR}
dir=${GAMES_DATADIR}/quake1

src_unpack() {
	unpack ${A}

	rm DEVKIT.* *.{DAT,CFG}

	# Make all filenames lower-case
	mv PAK0.PAK pak0.pak
	mv ZER.TXT ${MOD}.txt
	mv "${MOD}dem"/{readme,${MOD}dem}.txt
}

src_install() {
	insinto "${dir}/${MOD}"
	doins *.{dat,pak} || die "doins failed"

	insinto "${dir}"
	doins -r "${MOD}dem" || die "doins ${MOD}dem failed"

	# Wrapper for darkplaces engine. Will probably work with other engines.
	games_make_wrapper darkplaces-zerstorer "darkplaces -game ${MOD}"
	make_desktop_entry darkplaces-zerstorer "Dark Places (Zerstorer)" darkplaces.png

	games_make_wrapper darkplaces-zerstorer-trailer "darkplaces -game ${MOD}dem"
	make_desktop_entry darkplaces-zerstorer-trailer "Dark Places (Zerstorer trailer)" darkplaces.png

	dodoc *.txt ${MOD}dem/*.txt

	prepgamesdirs
}
