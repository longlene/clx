# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="Sam & Max Hit the Road"
#HOMEPAGE="http://foo.bar.com/"
#SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="x86"
IUSE=""
RESTRICT="strip"

RDEPEND=">=games-engines/scummvm-0.6.0"

S=${WORKDIR}

pkg_setup() {
	games_pkg_setup
	cdrom_get_cds SAMNMAX.000
}

src_install() {
	games_make_wrapper samnmax "scummvm -f -p \"${GAMES_DATADIR}/${PN}\" samnmax" .
	insinto "${GAMES_DATADIR}/${PN}"
	doins "${CDROM_ROOT}/SAMNMAX.000"
	doins "${CDROM_ROOT}/SAMNMAX.001"
	doins "${CDROM_ROOT}/MONSTER.SOU"
	prepgamesdirs
}
