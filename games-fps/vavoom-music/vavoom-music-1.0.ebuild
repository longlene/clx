# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

DESCRIPTION="Enhanced music for Vavoom"
HOMEPAGE="http://www.vavoom-engine.com/"

SRC_URI="doom1? ( mirror://sourceforge/vavoom/vmusic-doom1-${PV}.zip )
	doom2? ( mirror://sourceforge/vavoom/vmusic-doom2-${PV}.zip )
	heretic? ( mirror://sourceforge/vavoom/vmusic-heretic-${PV}.zip )
	hexen? ( mirror://sourceforge/vavoom/vmusic-hexen-${PV}.zip )
	plutonia? ( mirror://sourceforge/vavoom/vmusic-doom1-${PV}.zip
				mirror://sourceforge/vavoom/vmusic-doom2-${PV}.zip
				mirror://sourceforge/vavoom/vmusic-plutonia-${PV}.zip )
	tnt? (	mirror://sourceforge/vavoom/vmusic-doom2-${PV}.zip
			mirror://sourceforge/vavoom/vmusic-tnt-${PV}.zip )
	!doom1? ( !doom2? ( !heretic? ( !hexen? ( !plutonia? ( !tnt? (
		mirror://sourceforge/vavoom/vmusic-doom1-${PV}.zip
		mirror://sourceforge/vavoom/vmusic-doom2-${PV}.zip
		mirror://sourceforge/vavoom/vmusic-heretic-${PV}.zip
		mirror://sourceforge/vavoom/vmusic-hexen-${PV}.zip
		mirror://sourceforge/vavoom/vmusic-plutonia-${PV}.zip
		mirror://sourceforge/vavoom/vmusic-tnt-${PV}.zip
		) ) ) ) ) )"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doom1 doom2 heretic hexen plutonia tnt"

RDEPEND="games-fps/vavoom"
DEPEND="app-arch/unzip"

S=${WORKDIR}

src_unpack() {
	local game

	unpack ${A}

	for x in `find basev/ -name "xmusic.txt" -print` ; do
		game=$(echo ${x} | awk -F '/' {'print $2'})
		mv ${x} ${game}.txt || die "mv ${game}.txt failed"
	done
}

src_install() {
	dodoc *.txt || die "dodoc failed"

	insinto "${GAMES_DATADIR}/vavoom/"
	doins -r basev || die "doins failed"

	prepgamesdirs
}
