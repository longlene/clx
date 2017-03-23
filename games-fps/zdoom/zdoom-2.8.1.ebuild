# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit cmake-utils eutils versionator unpacker

DESCRIPTION="ZDoom is an enhanced port of the official DOOM source code"
HOMEPAGE="http://www.zdoom.org"
SRC_URI="http://www.zdoom.org/files/${PN}/$(get_version_component_range 1-2)/${P}-src.7z"

LICENSE="BSD BUILD DOOM"
SLOT="0"
KEYWORDS="~amd64 ~x86"
# FIXME fmod does not work
IUSE="asm gtk openal"

# fmod? ( media-libs/fmod:1 )
RDEPEND="app-arch/bzip2
	media-libs/game-music-emu
	media-libs/libsdl2
	openal? ( media-libs/openal )
	media-sound/fluidsynth
	sys-libs/zlib
	virtual/jpeg:0
	x11-libs/libXcursor
	gtk? ( x11-libs/gtk+:2 )"
DEPEND="${RDEPEND}
	asm? ( || ( dev-lang/nasm dev-lang/yasm ) )
	$(unpacker_src_uri_depends)"

S="${WORKDIR}"

DOCS=( "docs/commands.txt" )
HTML_DOCS=( "docs/console.{css,html}" )

src_prepare() {
	default

	sed -i \
		-e "s:/usr/local/share/:/usr/share/doom-data/:" \
	src/posix/i_system.h || die "sed i_system.h failed"

	sed -i \
		-e "s:/usr/local/share/doom:/usr/share/doom-data/:" \
	src/gameconfigfile.cpp || die "sed gameconfigfile.cpp failed"
}

src_configure() {
	mycmakeargs=(
#		"-DFMOD_LOCAL_LIB_DIRS=/opt/fmodex/api/lib"
#		"-DFMOD_INCLUDE_DIR=/opt/fmodex/api/inc"
		"-DGME_INCLUDE_DIR=/usr/include"
		"-DFORCE_INTERNAL_GME=no"
		-DNO_ASM=$(usex !asm)
#		-DNO_FMOD=$(usex !fmod)
		-DNO_GTK=$(usex !gtk)
		-DNO_OPENAL=$(usex !openal)
	)
	cmake-utils_src_configure
}

src_install() {
	dobin "${CMAKE_BUILD_DIR}/${PN}"
	insinto "/usr/share/doom-data"
	doins "${CMAKE_BUILD_DIR}/${PN}.pk3"
}

pkg_postinst() {
	echo
	elog "Copy or link wad files into /usr/share/doom-data/"
	elog
	elog "To play, simply run:"
	elog
	elog "   zdoom"
	echo
}
