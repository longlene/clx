# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

inherit games

MY_PN=MissileOfHolidayCheer

DESCRIPTION="A winter holiday vertically oriented flying finesse game."
HOMEPAGE="http://www.zarbosoft.com/page.cgi?News"
SRC_URI="http://www.zarbosoft.com/Distribution/${MY_PN}_${PV}.zip"

LICENSE="free"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT="mirror nostrip"

DEPEND="media-libs/libsdl
	media-libs/freealut
	media-libs/libvorbis
	media-libs/libogg"

S=${WORKDIR}/${MY_PN}_${PV}

src_install() {
	local dir=${GAMES_PREFIX_OPT}/${PN}

	cd ${S}

	exeinto ${dir}
	doexe  Missile.linbin  || die "doexe failed"
	insinto ${dir}
	doins -r Data || die "doins failed"
	
	dodoc RTFM.txt
	dohtml Manual.html
	newicon Data/Logo.tga ${PN}.png

	prepgamesdirs

	games_make_wrapper ${PN} ./Missile.linbin "${dir}" "${dir}"
	make_desktop_entry ${PN} "Missile of Holiday Cheer" ${PN}.png
}
