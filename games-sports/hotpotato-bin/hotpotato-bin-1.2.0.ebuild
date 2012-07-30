# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

MY_PN="hotpotato"
MY_P="HotPotatoOnlineBinary-v${PV}"

DESCRIPTION="Players try to explode the opposition using a short-fused potato bomb"
HOMEPAGE="http://hponline.sourceforge.net/"
SRC_URI="mirror://sourceforge/hponline/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=">=media-libs/libmikmod-3.1.11-r1
	>=media-libs/libogg-1.1.2
	>=media-libs/libsdl-1.2.8-r1
	>=media-libs/libvorbis-1.1.0
	>=media-libs/sdl-mixer-1.2.6
	virtual/opengl
	|| (
		(
			media-libs/mesa
			x11-libs/libX11
			x11-libs/libXau
			x11-libs/libXdmcp
			x11-libs/libXext
			x11-libs/libXxf86vm )
		virtual/x11 )"
DEPEND=""

S=${WORKDIR}/${MY_P}
dir=${GAMES_PREFIX_OPT}/${MY_PN}
exe="HotPotato"

src_install() {
	rm GPL.txt

	insinto "${dir}"
	exeinto "${dir}"
	doexe ${exe} && rm ${exe} || die
	doins -r * || die

	newicon inGame_Bomb/inGame_HealthPotato-001.png ${MY_PN}.png || die
	games_make_wrapper ${MY_PN} ./${exe} "${dir}"
	make_desktop_entry ${MY_PN} "Hot Potato" ${MY_PN}.png

	prepgamesdirs
}
