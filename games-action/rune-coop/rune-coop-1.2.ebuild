# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="Co-op mod for Rune"
HOMEPAGE="http://www.runegame.com/
	http://www.icculus.org/runecoop/"
SRC_URI="http://www.icculus.org/runecoop/rune_coop_${PV}.run"

LICENSE="LOKI-EULA"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="games-action/rune"
DEPEND=""

S=${WORKDIR}
dir=${GAMES_PREFIX_OPT}/rune

src_unpack() {
	unpack_makeself
	cd "${S}"
	tar -zxf data-co-op.tar.gz
}

src_install() {
	insinto "${dir}"
	doins -r Maps Meshes README* System || die "doins -r failed"

	prepgamesdirs
}
