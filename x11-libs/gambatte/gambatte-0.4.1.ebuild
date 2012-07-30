# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

inherit games

DESCRIPTION="An accuracy-focused Gameboy / Gameboy Color emulator"
HOMEPAGE="http://sourceforge.net/projects/gambatte"
SRC_URI="mirror://sourceforge/${PN}/${PN}_src-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="qt4"

# builds SDL version only if qt4 isn't USEd
RDEPEND="!qt4? ( media-libs/libsdl )
	qt4? (
		x11-libs/qt-gui:4
		x11-libs/qt-opengl:4
		x11-libs/libX11
		x11-libs/libXv
		x11-libs/libXrandr
		media-libs/alsa-lib
	)"
DEPEND="${RDEPEND}
	dev-util/scons"

S=${WORKDIR}/${PN}_src-${PV}

src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_compile() {
	use qt4 && ./build_qt.sh || ./build_sdl.sh
}

src_install() {
	use qt4 && dogamesbin gambatte_qt/bin/gambatte_qt || dogamesbin gambatte_sdl/gambatte_sdl
	dodoc README changelog
	doman gambatte_qt/man/gambatte_qt.6 gambatte_sdl/man/gambatte_sdl.6
	prepgamesdirs
}
