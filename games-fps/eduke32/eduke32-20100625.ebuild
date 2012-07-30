# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit eutils games

MY_BUILD="1661"
MY_HRP="4.0"
MY_HRP_BUILD="321"

DESCRIPTION="Port of Duke Nukem 3D for SDL"
HOMEPAGE="http://www.eduke32.com/
	http://hrp.duke4.net/"
SRC_URI="http://dukeworld.duke4.net/eduke32/synthesis/${PV}-${MY_BUILD}/${PN}_src_${PV}-${MY_BUILD}.tar.bz2
	textures? ( http://www.duke4.org/files/hrp/dn3d_hrp-${MY_HRP}%28${MY_HRP_BUILD}%29.zip -> dn3d_hrp-${MY_HRP}-${MY_HRP_BUILD}.zip )
	music? ( http://www.duke4.org/files/nightfright/eduke32_mus.zip )"

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="editor textures music"

RDEPEND="x11-libs/gtk+
	media-libs/libsdl
	music? ( media-libs/sdl-mixer[timidity] )
	!music? ( media-libs/sdl-mixer )
	media-libs/libvorbis"
DEPEND="${RDEPEND}
	app-arch/unzip"

S=${WORKDIR}/${PN}_${PV}-${MY_BUILD}

src_unpack() {
	unpack "${PN}_src_${PV}-${MY_BUILD}.tar.bz2"
	if use textures; then
		unpack "dn3d_hrp-${MY_HRP}-${MY_HRP_BUILD}.zip"
	fi
}

src_install() {
	insinto "${GAMES_DATADIR}/${PN}"
	exeinto "${GAMES_DATADIR}/${PN}"
	doexe ${PN}
	games_make_wrapper ${PN} "${GAMES_DATADIR}/${PN}/${PN}" "${GAMES_DATADIR}/${PN}"
	if use editor; then
		doexe mapster32 || die
		games_make_wrapper mapster32 "${GAMES_DATADIR}/${PN}/mapster32" "${GAMES_DATADIR}/${PN}"
	fi

	if use textures; then
		doins "${WORKDIR}"/autoload/duke3d.grp/*.zip
		dodoc "${WORKDIR}/hrp_art_license.txt" "${WORKDIR}/hrp_readme.txt"
		sed -i 's/"$@"/-g duke3d_hrp.zip -g maphacks.zip "$@"/' "${D}/${GAMES_BINDIR}/${PN}"
	fi

	if use music; then
		doins "${DISTDIR}/eduke32_mus.zip"
		sed -i 's/"$@"/-g eduke32_mus.zip "$@"/' "${D}/${GAMES_BINDIR}/${PN}"
	fi

	make_desktop_entry ${PN} "EDuke32"

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst
	ewarn "Note: You must also install games-fps/duke3d-data before playing this game."
}
