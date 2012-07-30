# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# ***** Test audacious ******

inherit eutils flag-o-matic multilib toolchain-funcs games

DESCRIPTION="Enhanced Quake 2 engine with Gloom effects"
HOMEPAGE="http://egl.quakedev.com/
	http://qudos.quakedev.com/linux/quake2/engines/egl/"
# Takes the assets tarball from subversion, until version 0.3.2 is released
# **** Includes audacious patch ********
SRC_URI="http://qudos.quakedev.com/linux/quake2/engines/egl/EGL-SDL-source-${PV}.tar.bz2
	http://svn.quakedev.com/viewvc.cgi/egl/trunk/assets.tar.gz"

LICENSE="GPL-2"
SLOT="0"
# Should work on amd64 also
KEYWORDS="~x86"
# OpenAL sound is broken, so ignore openal
IUSE="audacious dedicated demo dga opengl optimize-cflags sdl textures"

UIDEPEND="audacious? ( media-sound/audacious )
	dga? ( x11-libs/libXxf86dga )
	opengl? ( virtual/opengl )
	!opengl? ( !sdl? ( !dedicated? ( virtual/opengl ) ) )
	sdl? (
		media-libs/libsdl
		x11-libs/libXxf86vm )"
# EGL works with the demo data.
# Chooses either the demo or CD data, because the engine needs data.
RDEPEND="${UIDEPEND}
	demo? ( games-fps/quake2-demodata )
	!demo? ( games-fps/quake2-data )
	textures? ( games-fps/quake2-textures )"
DEPEND="${UIDEPEND}"

S=${WORKDIR}/EGL-SDL-source-${PV}
dir=${GAMES_DATADIR}/quake2

pkg_setup() {
	games_pkg_setup

	if (use opengl || ! use dedicated) && ! use sdl ; then
		echo
		ewarn "The 'sdl' USE flag for this game is recommended over opengl,"
		ewarn "for reliability when e.g. changing screen resolution."
		ebeep
		epause
	fi
}

src_unpack() {
	unpack ${A}
	cd "${S}"

	# ***** For audacious test ********
	#cp -rf ../EGL-SDL-0.3.2-src-2006-11-11/* . || die

	# For openal test ********************
	cd client || die
	wget http://qudos.quakedev.com/snd_openal.c || die
	mv -f snd_openal.c{.1,} || die
	cd "${S}"

	local march=$(get-flag -march)
	sed -i \
		-e "s:-march=\$(MACHINE):${march}:" \
		makefile || die "sed makefile failed"
}

src_compile() {
	yesno() { useq $1 && echo YES || echo NO ; }

	local libdir=$(games_get_libdir)/${PN}

	local target="release"
	# debug does not work
	#use debug && target="debug"

	local build_opengl="NO"
	# sdl takes priority - produces a different executable to opengl
	if ! use sdl ; then
		if use opengl || ! use dedicated ; then
			build_opengl="YES"
		fi
	fi

	# Prevent potential for "signal 11" abort, requested by QuDos
	filter-flags -fomit-frame-pointer

	emake -j1 \
		BUILD_CLIENT=${build_opengl} \
		BUILD_SDL_CLIENT=$(yesno sdl) \
		BUILD_DEDICATED=$(yesno dedicated) \
		WITH_XF86VM_EXT=$(yesno sdl) \
		WITH_DGA_MOUSE=$(yesno dga) \
		WITH_AUDACIOUS=$(yesno audacious) \
		WITH_XMMS=NO \
		LOCALBASE=/usr \
		GAMEBASE=/usr \
		DATADIR="${dir}" \
		LIBDIR="${libdir}" \
		OPTIMIZE=$(yesno optimize-cflags) \
		CC=$(tc-getCC) \
		WITH_DATADIR=YES \
		WITH_LIBDIR=YES \
		VERBOSE=YES \
		STRIP=NO \
		BUILD_DEBUG_DIR=release \
		BUILD_RELEASE_DIR=release \
		|| die "emake failed"
# Use in most recent sources:		${target} \
}

src_install() {
	# No icon yet
	#local icon="quake2.xpm"
	#doicon "${FILESDIR}/${icon}" || die

	local libdir=$(games_get_libdir)/${PN}

	local client
	[[ -e quake2/egl ]] && client="egl"
	[[ -e quake2/egl-sdl ]] && client="egl-sdl"

	if [[ -n "${client}" ]] ; then
		newgamesbin quake2/"${client}" ${PN} \
			|| die "newgamesbin ${client} failed"
		if use demo ; then
			games_make_wrapper ${PN}-demo "${PN} +set game demo"
			make_desktop_entry ${PN}-demo "EGL (Demo)" "${icon}"
		else
			make_desktop_entry ${PN} "EGL" "${icon}"
		fi
	fi

	if use dedicated ; then
		newgamesbin quake2/eglded egl-ded || die "newgamesbin eglded failed"
	fi

	exeinto "${libdir}"/baseq2
	doexe quake2/baseq2/*.so || die "doexe *.so failed"

	insinto "${libdir}"/baseq2
	doins "${WORKDIR}"/assets/* || die
	# http://egl.quakedev.com/files/addons/
	doins -r "${WORKDIR}"/assets/addons/* || die

	dodoc "${S}"/*.txt

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	if use demo ; then
		elog "To play EGL with the demo data, run:  egl-demo"
		echo
	fi
}
