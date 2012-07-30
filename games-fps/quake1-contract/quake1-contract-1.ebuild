# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

MOD="contract"
L="http://kell.leveldesign.org"
Q="http://www.quaddicted.com/filebase"

DESCRIPTION="Contract Revoked - Quake 1 single-player pack"
HOMEPAGE="http://kell.leveldesign.org/"
SRC_URI="${L}/${MOD}.zip
	${Q}/${MOD}.zip"

# See contract.html
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

	# Make filenames lower-case
	mv PAK0.PAK pak0.pak
}

src_install() {
	insinto "${dir}"
	doins *.pak || die "doins failed"

	# Wrapper for darkplaces engine. Will probably work with other engines.
	games_make_wrapper darkplaces-${MOD} "darkplaces -game ${MOD}"
	make_desktop_entry darkplaces-${MOD} "Dark Places (Contract Revoked)" darkplaces.png

	dohtml *.html

	prepgamesdirs
}