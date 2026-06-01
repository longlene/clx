# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
#
# @ECLASS: raine.eclass
# @MAINTAINER: Per Wigren <per.wigren@gmail.com>
# @BLURB: Common functions for Raine and Neoraine

inherit versionator games flag-o-matic

MUPARSER_VERSION="1.28"

SRC_URI="
	http://www.rainemu.com/html/archive/raines-${RAINE_VERSION}.tar.bz2
	amd64? ( mirror://sourceforge/muparser/muparser_v${MUPARSER_VERSION/./}.tar.gz )
"
LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64"


RDEPEND="
	media-libs/libsdl
	sys-libs/zlib
	media-libs/sdl-sound
	media-libs/sdl-image
	media-libs/sdl-ttf
	x86?   ( dev-cpp/muParser )
	amd64? ( app-emulation/emul-linux-x86-baselibs )
	amd64? ( app-emulation/emul-linux-x86-xlibs )
	amd64? ( app-emulation/emul-linux-x86-sdl )
	amd64? ( app-emulation/emul-linux-x86-soundlibs )
"
DEPEND="
	${RDEPEND}
	dev-lang/nasm
	app-arch/unzip
"

S=${WORKDIR}/raine-${RAINE_VERSION}
GAME_SHAREDIR="${GAMES_DATADIR}/${PN}"

src_unpack() {
	unpack ${A}
	cd "${S}"

	sed -i ${MAKEFILE} \
		-e "/prefix =/s:/usr::" \
		-e "s:\$(prefix):\$(DESTDIR)/usr:g" \
		-e "/bindir/s:=.*:=\$(DESTDIR)${GAMES_BINDIR}:" \
		-e "/sharedir =/s:=.*:=\$(DESTDIR)${GAMES_DATADIR}:" \
		-e "/mandir/s:=.*:=\$(DESTDIR)/usr/share/man/man6:" \
		-e "/rainedata/s:=.*:=\$(DESTDIR)/${GAME_SHAREDIR}:" \
		-e "/bitmaps_dir/s:=.*:=\$(DESTDIR)/${GAME_SHAREDIR}/bitmaps:" \
		-e "s:-lefence::" \
		-e "/raine\.desktop/d" \
		-e "/cheats\.cfg/d" \
		-e "/INSTALL.*\(fonts|bitmaps\)/d" \
		|| die "sed 1 failed"

	if use amd64; then
		sed -i ${MAKEFILE} \
			-e "s:X86_64:X86_65:g" \
			-e "s:-lmuparser:${WORKDIR}/muparser/lib/libmuparser.a:" \
			-e "s:-I/usr/include/muParser:-I${WORKDIR}/muparser/include:" \
			|| die "sed 2 failed"
	fi

	sed -i source/raine.cpp \
		-e "s:/usr/share/games/raine/:${GAME_SHAREDIR}/:"
}

src_compile() {
	if use amd64; then
		export CC="${CC:-gcc} -m32"
		export CXX="${CXX:-g++} -m32"
		cd "${WORKDIR}/muparser"
		econf --disable-{shared,samples}
		emake
	fi

	filter-flags -O -O?

	cd "${S}"
	emake -f ${MAKEFILE} _MARCH="${CFLAGS}" VERBOSE=1 || die "emake failed"
}

src_install() {
	emake -f ${MAKEFILE} DESTDIR="${D}" install || die "emake install failed"
	keepdir "${GAME_SHAREDIR}"/{roms,artwork}
	dodoc docs/*

	insinto "${GAME_SHAREDIR}/fonts"
	doins fonts/*

	insinto "${GAME_SHAREDIR}/config"
	doins config/${PN/raine/}cheats.cfg
	
	insinto "${GAME_SHAREDIR}/bitmaps"
	doins bitmaps/*

	make_desktop_entry ${PN} $(echo $PN | sed 's:\(.\):\U\1:') ${PN}
	prepgamesdirs
}
