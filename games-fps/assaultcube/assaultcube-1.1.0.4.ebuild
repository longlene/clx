# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils games multilib toolchain-funcs

DESCRIPTION="Fast and fun first-person-shooter based on the Cube fps"
HOMEPAGE="http://assault.cubers.net"
MY_PN="AssaultCube"

SRC_URI="mirror://sourceforge/actiongame/${MY_PN}%20Version%20${PV}/${MY_PN}_v${PV}.tar.bz2
	mirror://sourceforge/actiongame/${MY_PN}%20Version%20${PV}/${MY_PN}_v${PV}_source.tar.bz2"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dedicated doc opengl"

RDEPEND="opengl? (
		media-libs/libsdl
		media-libs/libogg
		media-libs/libvorbis
		media-libs/openal
		media-libs/sdl-image
		virtual/opengl
		x11-libs/libX11 )"
DEPEND="${RDEPEND}
	>=net-libs/enet-1.2.1"

S=${WORKDIR}/${PV}

pkg_setup() {
	if ! use dedicated && ! use opengl ; then
		eerror "You need to set USE=dedicated for game server or USE=opengl for game client."
		die
	fi
}

src_prepare() {
	rm -r bin_unix/* || die
	find packages -name readme.txt -exec rm -f {} + || die
	#winicontoppm fails with compressed icons
	#winicontoppm source/vcpp/buildEnv/icon.ico | ppmtoxpm > ${PN}.xpm || die
	mv source/vcpp/buildEnv/icon.ico ${PN}.ico || die
	sed -i -e "/^CUBE_DIR=/d ; 2iCUBE_DIR=$(games_get_libdir)/${PN}" ${PN}.sh server.sh || die
	sed -i -e "s:bin_unix/\${SYSTEM_NAME}\${MACHINE_NAME}:ac_:" ${PN}.sh server.sh || die
	sed -i -e "s:cd \${CUBE_DIR}:cd ${GAMES_DATADIR}/${PN}:" ${PN}.sh server.sh || die
}

src_compile() {
	tc-export CXX
	emake -C source/src CXXOPTFLAGS="${CXXFLAGS}" libenet || die
	if use opengl ; then
		emake -C source/src CXXOPTFLAGS="${CXXFLAGS}" client || die
	fi
	if use dedicated ; then
		emake -C source/src CXXOPTFLAGS="${CXXFLAGS}" server || die
	fi
}

src_install() {
	insinto "${GAMES_DATADIR}/${PN}"

	#doins -r bot config packages || die
	doins -r config packages || die

	exeinto "$(games_get_libdir)/${PN}"
	if use opengl ; then
		doexe source/src/ac_client || die
		newgamesbin ${PN}.sh ${PN} || die
		make_desktop_entry ${PN} ${MY_PN} ${PN}
	fi
	if use dedicated ; then
		doexe source/src/ac_server || die
		newgamesbin server.sh ${PN}-server || die
		make_desktop_entry ${PN}-server "${MY_PN} Server" ${PN}
	fi
	insinto /usr/share/pixmaps
#	doins ${PN}.xpm || die
	doins ${PN}.ico || die

	if use doc ; then
		rm -r docs/autogen || die
		dohtml -r docs/* || die
	fi

	prepgamesdirs
}

