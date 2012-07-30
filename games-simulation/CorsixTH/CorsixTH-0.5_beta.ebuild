# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit cmake-utils games

DESCRIPTION="An open-source clone of Theme Hospital"
MY_V="Beta5"
SRC_URI="http://corsix-th.googlecode.com/files/CorsixTH-${MY_V}-Source.tar.gz"
HOMEPAGE="https://code.google.com/p/corsix-th/"
KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENCE="as-is"
IUSE="opengl audio luajit"
EAPI=2
CMAKE_USE_DIR=${WORKDIR}/${PN}-${MY_V}-Source
DEPEND="audio? ( >=media-libs/libsdl-1.2.0 )
	>=dev-lang/lua-5.1.0
	opengl?	( virtual/opengl )
	luajit? ( dev-lang/luajit )"

rdsrc_unpack() {
	unpack ${A}
}

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="${GAMES_DATADIR}"
		$(cmake-utils_use_with opengl OPENGL)
		$(cmake-utils_use_with audio AUDIO)
	)	
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_make
}

src_install() {
	CORSIXSCRIPT="${D}/${GAMES_DATADIR}/${PN}/CorsixTH.sh"
	cmake-utils_src_install
	touch ${CORSIXSCRIPT}
	echo "#!/bin/bash" > "${CORSIXSCRIPT}"
	echo "cd ${GAMES_DATADIR}/${PN}" >>  "${CORSIXSCRIPT}"
	echo "./${PN}" >> "${CORSIXSCRIPT}"
	chmod +x "${CORSIXSCRIPT}"
	dosym "${GAMES_DATADIR}/${PN}/CorsixTH.sh" "${GAMES_BINDIR}/${PN}/CorsixTH"
	
	prepgamesdirs

	#icon
	insinto "/usr/share/pixmaps"
	cp "${WORKDIR}/${PN}-Beta5-Source/LDocGen/output/logo.png" "${D}CorsixTH.png"
	doins "${D}${PN}.png"
	make_desktop_entry "${GAMES_DATADIR}/${PN}/CorsixTH" "${PN}" "/usr/share/pixmaps/${PN}.png" "Game" "Path=${GAMES_DATADIR}/${PN}"
}
