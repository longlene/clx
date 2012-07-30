# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils games qt4

DESCRIPTION="Dexterity game for 2-8 players on one computer"
HOMEPAGE="http://openorbiter.sourceforge.net/"
SRC_URI="mirror://sourceforge/openorbiter/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="opengl svg"
LANGS="de en"

for X in ${LANGS} ; do
	IUSE="${IUSE} linguas_${X}"
done

RDEPEND="
	x11-libs/qt-gui:4
	opengl? ( x11-libs/qt-opengl:4 )
	svg? ( x11-libs/qt-svg:4 )
"

DEPEND="$RDEPEND"

src_configure() {
	CONFIG=""
	use svg || CONFIG="$CONFIG disable-svg"
	use opengl || CONFIG="$CONFIG disable-opengl"
	eqmake4 openorbiter.pro CONFIG+="$CONFIG" DATADIR="/usr/share/games/${PN}"
	
	strip-linguas ${LANGS}
	local l
	for l in ${LANGS}; do
		if [ "$l" != "en" ] && use linguas_$l; then
			lrelease "data/translations/openorbiter_${l}.ts" || die "lrelease failed"
		fi
	done
}

src_install() {
	dogamesbin bin/openorbiter || die "dogamesbin failed"
	
	insinto "${GAMES_DATADIR}/${PN}/maps"
	doins -r data/maps/*.xml || die "doins failed"
	
	if use svg; then
		insinto "${GAMES_DATADIR}/${PN}/gfx"
		doins -r data/gfx/*.svg || die "doins failed"
	fi
	
	local l
	for l in ${LANGS}; do
		if [ "$l" != "en" ] && use linguas_$l; then
			insinto "${GAMES_DATADIR}/${PN}/translations"
			doins -r data/translations/*.qm || die "doins failed"
		fi
	done
	
	dodoc NEWS README
	
	mv res/orbiter-64.png res/openorbiter.png
	doicon res/openorbiter.png
	make_desktop_entry openorbiter OpenOrbiter
	
	prepgamesdirs
}
