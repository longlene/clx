# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

MOD="chapters"
L="http://kell.leveldesign.org/${MOD}"
Q="http://www.quaddicted.com/filebase"

DESCRIPTION="Contract Revoked: The Lost Chapters - Quake 1 single-player pack"
HOMEPAGE="http://kell.leveldesign.org/"
SRC_URI="${L}/${MOD}.zip
	${Q}/${MOD}.zip"

# See chapters.txt
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

src_install() {
	insinto "${dir}"
	doins "${MOD}"/*.pak || die "doins failed"

	# Wrapper for darkplaces engine. Will probably work with other engines.
	# The "hipnotic" expansion pack does *not* need to be installed.
	games_make_wrapper darkplaces-${MOD} "darkplaces -hipnotic -game ${MOD} +map start"
	make_desktop_entry darkplaces-${MOD} \
		"Dark Places (Contract Revoked - Lost Chapters)" darkplaces.png

	dodoc "${MOD}"/*.txt

	prepgamesdirs
}