# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

inherit eutils games

DESCRIPTION="a free real time strategy game that takes place in space"
HOMEPAGE="http://rrgbis.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="media-libs/sdl-image
	media-libs/sdl-gfx"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}

src_unpack() {
	unpack ${A}
	cd ${S}
	sed -i Makefile -e 's:local/share:share/games/rrgbis:'	|| die "sed failed"
	sed -i Makefile -e 's:local/bin:games/bin:'	|| die "sed failed"
}

src_compile() {
	emake CXXFLAGS="${CXXFLAGS} $(sdl-config --cflags) -Isrc/squirrel/include" || die "emake failed"
}

src_install() {
	local dir=${GAMES_DATADIR}/${PN}
	exeinto ${dir}
	doexe ${PN}
	insinto ${dir}
	doins -r aiscripts images missions music rrgbis.{ico,png} \
		settings.dat sound squirrelscripts unit{data,pictures}	|| die "doins failed"

	doicon ${PN}.png
	make_desktop_entry ${PN} "RRGBiS" ${PN}.png
	games_make_wrapper ${PN} ./${PN} ${dir} ${dir}
	prepgamesdirs

	dodoc *.txt
}

