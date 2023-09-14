# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

MOD="czg07"
M="http://www.quaketerminus.com/mods"
B="http://www.quaddicted.com/filebase"

DESCRIPTION="Classic Quake 1 mod with huge levels"
HOMEPAGE="http://retroquake.planetquake.gamespy.com/blog/?p=72"
SRC_URI="${M}/${MOD}.zip
	${B}/${MOD}.zip"

# See czg07.txt
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

	rm *.zip
}

src_install() {
	insinto "${dir}"
	doins *.{cfg,dat,pak} || die "doins failed"

	# Wrapper for darkplaces engine. Will probably work with other engines.
	games_make_wrapper darkplaces-insomnia "darkplaces -game ${MOD}"
	make_desktop_entry darkplaces-insomnia "Dark Places (Insomnia)" darkplaces.png

	dodoc *.txt

	prepgamesdirs
}
