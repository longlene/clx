# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=2

inherit games qt4 subversion

MY_PV=${PV/_alpha/-wip}

DESCRIPTION="An accuracy-focused Gameboy / Gameboy Color emulator"
HOMEPAGE="http://sourceforge.net/projects/gambatte"
#SRC_URI="mirror://sourceforge/${PN}/${PN}_src-${MY_PV}.tar.gz"

ESVN_REPO_URI="https://gambatte.svn.sourceforge.net/svnroot/gambatte"
ESVN_PROJECT="gambatte"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="alsa sdl qt4"

# builds SDL version only if qt4 isn't USEd
RDEPEND="sdl? ( media-libs/libsdl )
	qt4? (
		x11-libs/qt-gui:4
		x11-libs/qt-opengl:4
		x11-libs/libX11
		x11-libs/libXv
		x11-libs/libXrandr
		x11-libs/libXext
		media-libs/alsa-lib
		sys-devel/make
	)
	alsa? ( media-libs/alsa-lib )"
DEPEND="${RDEPEND}
	dev-util/scons
	dev-vcs/subversion"

S=${WORKDIR}/${PN}_src-${MY_PV}

pkg_setup() {
	# Validate USE flags
	if ! use sdl && ! use qt4; then
		die "You must enable at least one frontend using the 'sdl' and 'qt4' USE flags."
	fi;
}

src_compile() {
	# Set options for parallel build
	cd "${S}"
	local sconsopts=$(echo "${MAKEOPTS}" | sed -ne "/-j/ { s/.*\(-j[[:space:]]*[0-9]\+\).*/\1/; p }")

	# build core library
	cd "${S}/libgambatte"
	scons ${sconsopts} || die "library build failed"

	# build sdl frontend
	if use sdl; then
		cd "${S}/gambatte_sdl"
		scons ${sconsopts} || die "sdl build failed"
	fi

	# build qt frontend
	if use qt4; then
		cd "${S}/gambatte_qt"
		eqmake4 ${PN}_qt.pro
		emake || die "qt build failed"
	fi
}

src_install() {
	if use sdl; then
		dogamesbin gambatte_sdl/gambatte_sdl || die "sdl install failed"
		doman gambatte_sdl/man/gambatte_sdl.6
	fi
	if use qt4; then
		dogamesbin gambatte_qt/bin/gambatte_qt || die "qt install failed"
		doman gambatte_qt/man/gambatte_qt.6
	fi

	dodoc README changelog

	prepgamesdirs
}
