# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-emulation/sdlmame/sdlmame-0.141_p2.ebuild,v 1.1 2011/02/11 06:06:50 mr_bones_ Exp $

EAPI=8
inherit eutils flag-o-matic games

MY_PV=${PV/.}
MY_CONF_PN=${PN/sdl}
MY_P=${PN}${MY_PV}
MY_PM=${MY_P/mess/mame}
MY_CONF_VER="0.141"
DESCRIPTION="Multiple Emulator Super System (SDL)"
HOMEPAGE="http://www.mess.org/"
SRC_URI="http://www.mess.org/files/${MY_P/sdl}s.zip
	http://www.mame.org/files/${MY_PM/sdl}s.zip
	http://www.netswarm.net/misc/sdlmame-ui.bdf.gz"

LICENSE="XMAME"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="debug opengl"

RDEPEND=">=media-libs/libsdl-1.2.10[audio,joystick,opengl?,video]
	media-libs/sdl-ttf
	dev-libs/expat
	debug? (
		x11-libs/gtk+:2
		gnome-base/gconf
		x11-libs/libXinerama
	)"
DEPEND="${RDEPEND}
	app-arch/unzip
	debug? ( x11-proto/xineramaproto )"

S=${WORKDIR}

# Function to disable a makefile option
disable_feature() {
	sed -i \
		-e "/$1.*=/s:^:# :" \
		"${S}"/makefile \
		|| die "sed failed"
}

# Function to enable a makefile option
enable_feature() {
	sed -i \
		-e "/^#.*$1.*=/s:^# ::"  \
		"${S}"/${2:-makefile} \
		|| die "sed failed"
}

src_unpack() {
	base_src_unpack
	unpack ./mame.zip
	# just repeat it to enure it's done last
	unpack ${MY_P/sdl}s.zip
	rm -f mame.zip
}

src_prepare() {
	sed -i \
		-e '/CFLAGS += -O$(OPTIMIZE)/s:^:# :' \
		-e '/CFLAGS += -pipe/s:^:# :' \
		-e '/LDFLAGS += -s/s:^:# :' \
		-e '/LDFLAGS =/d' \
		-e 's:-Werror::' \
		makefile \
		|| die "sed failed"
	# Don't compile zlib and expat
	einfo "Disabling embedded libraries: zlib and expat"
	disable_feature BUILD_ZLIB
	disable_feature BUILD_EXPAT

	if use amd64; then
		einfo "Enabling 64-bit support"
		enable_feature PTR64
	fi

	if use ppc; then
		einfo "Enabling PPC support"
		enable_feature BIGENDIAN
	fi

	if use debug; then
		einfo "Enabling debug support"
		enable_feature DEBUG
	else
		einfo "Disabling debug support"
		enable_feature NO_X11 src/osd/sdl/sdl.mak
	fi

	if ! use opengl ; then
		einfo "Disabling opengl support"
		enable_feature NO_OPENGL src/osd/sdl/sdl.mak
	fi
}

src_compile() {
	emake \
		NAME="${PN}" \
		OPT_FLAGS='-DINI_PATH=\"\$$HOME/.'${PN}'\;'"${GAMES_SYSCONFDIR}/${PN}"'\"'" ${CXXFLAGS}" \
		CC="${CXX}" \
		all TARGET=mess || die
}

src_install() {
	newgamesbin ${PN}$(use amd64 && echo 64)$(use debug && echo d) ${PN} || die

	# Avoid collision on /usr/games/bin/jedutil
	exeinto "$(games_get_libdir)/${PN}"
	doexe castool chdman dat2html imgtool jedutil ldresample ldverify \
	      messtest regrep romcmp split src2html srcclean testkeys unidasm || die
	# this will override mame
	doman src/osd/sdl/man/ldplayer.1
#	doman src/osd/sdl/man/{chdman,jedutil,ldplayer,ldverify,romcmp,testkeys}.1

	insinto "${GAMES_DATADIR}/${PN}"
	doins -r src/osd/sdl/keymaps || die "doins -r keymaps failed"
	newins sdlmame-ui.bdf ui.bdf || die "newins ui.bdf failed"

	insinto "${GAMES_SYSCONFDIR}/${PN}"

	sed \
		-e "s:@GAMES_SYSCONFDIR@:${GAMES_SYSCONFDIR}:" \
		-e "s:@GAMES_DATADIR@:${GAMES_DATADIR}:" \
		"${FILESDIR}/${MY_CONF_PN}-${MY_CONF_VER}".ini.in > "${D}/${GAMES_SYSCONFDIR}/${PN}/${MY_CONF_PN}".ini \
		|| die "sed failed"

	dodoc docs/* *.txt *.dat

	keepdir \
		"${GAMES_DATADIR}/${PN}"/{hash,ctrlr,cheats,roms,samples,artwork,crosshair} \
		"${GAMES_SYSCONFDIR}/${PN}"/{ctrlr,cheats}
	for dir in hash artwork; do
		insinto "${GAMES_DATADIR}/${PN}"/$dir
		doins $dir/*
	done

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	elog "It's strongly recommended that you change either the system-wide"
	elog "${MY_CONF_PN}.ini at \"${GAMES_SYSCONFDIR}/${PN}\" or use a per-user setup at \$HOME/.${PN}"

	if use opengl; then
		echo
		elog "You built ${PN} with opengl support and should set"
		elog "\"video\" to \"opengl\" in ${MY_CONF_PN}.ini to take advantage of that"
	fi
}
