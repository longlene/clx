# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit autotools flag-o-matic git-2

DESCRIPTION="PUAE tries to continue where E-UAE left off."
HOMEPAGE="https://github.com/GnoStiC/PUAE"
EGIT_REPO_URI="https://github.com/GnoStiC/PUAE.git"
SRC_URI=""
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="a2065 a2091 +alsa amax +audio cdtv cd32 +debugger dga \
      drvsnd enforcer +fpu gayle +gtk jit ncr +natmem noflags ncurses \
			profiling qt +save-state scsi-device +sdl +sdl-gfx sdl-gl \
			sdl-sound threads +ui vidmode +xarcade X"

RDEPEND="
	alsa?      ( !sdl-sound? ( media-libs/alsa-lib ) )
	gtk?       ( >=x11-libs/gtk+-2 )
	ncurses?   ( !qt? ( !sdl-gfx? ( sys-libs/ncurses ) ) )
	qt?        ( !gtk? ( x11-libs/qt-gui ) )
	sdl?       ( media-libs/libsdl )
	sdl-gfx?   ( !qt? ( media-libs/sdl-gfx ) )
	sdl-sound? ( media-libs/sdl-sound )
	sdl-gl?    ( !qt? ( virtual/opengl ) )
	X?         ( x11-libs/libX11
							 dga? ( x11-libs/libXxf86dga )
						 )
"
DEPEND="${DEPEND} ${RDEPEND}
	X?         ( dga?     ( x11-proto/xf86dgaproto )
							 vidmode? ( x11-proto/xf86vidmodeproto )
						 )
"

src_prepare() {
	# One of the unzip.h files (why use two anyway?) is wrong (right now), fix it:
	epatch "${FILESDIR}"/001_fix_wrong_unzip_h.patch

	# Thanks to parallel build, tools/build68k might be called before it is ready.
	# Little but nasty solution: Add a small delay
	epatch "${FILESDIR}"/002_wait_for_build68k_to_be_ready.patch

	eautoreconf
}

src_configure() {
	local myconf=""
	local hasUI=0
	local needSDL=0

	# the following warnings are issued very often, and the user can't help it
	append-cflags -Wno-int-to-pointer-cast -Wno-pointer-to-int-cast -Wno-sign-compare
	append-cflags -Wno-missing-prototypes -Wno-implicit -fno-strict-aliasing
	append-cflags -std=gnu99

	# gtk is the default ui. If it is enabled, qt must not be enabled,
	# or it replaces the gtk ui.
	if use ui ; then
		myconf="${myconf} --enable-ui"
		if use gtk ; then
			myconf="${myconf} --enable-gtktest --without-qt"
			hasUI=1
		fi
		if use qt ; then
			if ! use gtk ; then
				myconf="${myconf} --disable-gtktest --with-qt"
				hasUI=1
			else
				# Notify user if both have been set
				elog "Both gtk and qt USE flag are enabled."
				elog "As gtk is preferred over qt, qt is ignored."
			fi
		fi
		if [ ${hasUI} -eq 0 ] ; then
			ewarn "ui USE flag set, but neither gtk nor qt chosen."
			elog "--> gtk is selected automatically."
			myconf="${myconf} --enable-gtktest --without-qt"
			hasUI=1
		fi
	fi

	# Both gtk and qt ui need threads:
	if [ ${hasUI} -eq 1 ] ; then
		if ! use threads ; then
			ewarn "Both gtk and qt ui need threads. Therefore"
			ewarn "threads are enabled despite USE flag setting"
		fi
		myconf="${myconf} --enable-threads"
	else
		myconf="${myconf} $(use_enable threads)"
	fi

	# Graphics are done via sdl-gfx (plus sdl-gl), X, qt
	# or ncurses (in this order)
	if use sdl-gfx ; then
		myconf="${myconf} --with-sdl-gfx --without-curses"
		needSDL=$((needSDL+1))
		elog "sdl-gfx chosen for graphic output."
		if use sdl-gl ; then
			myconf="${myconf} --with-sdl-gl"
		fi
		# Notify user if qt and/or ncurses are set, too:
		use qt && elog "-> qt USE flag ignored"
		use ncurses && elog "-> ncurses USE flag ignored"
	elif use X ; then
		myconf="${myconf} --with-x \
			$(use_enable dga) \
			$(use_enable vidmode)"
		elog "X chosen for graphic output"
	elif use qt ; then
		# qt can only be enabled if we do not use gtk
		if ! use gtk ; then
			myconf="${myconf} --without-sdl-gfx --without-sdl-gl"
			myconf="${myconf} --without-curses"
			if [ ${hasUI} -eq 0 ] ; then
				myconf="${myconf} --with-qt --disable-gtktest"
			fi
			elog "qt chosen for graphic output."
			use ncurses && elog "-> ncurses USE flag ignored"
		elif [ ${hasUI} -eq 0 ] ; then
			myconf="${myconf} --without-sdl-gfx --without-sdl-gl"
			myconf="${myconf} --without-curses"
			myconf="${myconf} --with-qt --disable-gtktest"
			elog "qt chosen for graphic output."
			use gtk && elog "-> gtk USE flag ignored, as no ui is used"
			use ncurses && elog "-> ncurses USE flag ignored"
		else
			# tell the user that qt is disabled if gtk is in use
			# without-qt and enable-gtktest are already set
			elog "You can not use qt for graphics when gtk is"
			elog "chosen for the ui. Therefore gtk/sdl is chosen."
			use ncurses && elog "-> ncurses USE flag ignored"
			myconf="${myconf} --with-sdl-gfx --without-curses"
			needSDL=$((needSDL+1))
			if use sdl-gl ; then
				myconf="${myconf} --with-sdl-gl"
			fi
		fi
	elif use ncurses ; then
		# who wants to use that?
		myconf="${myconf} --without-sdl-gfx --without-sdl-gl"
		myconf="${myconf} --without-qt --with-curses"
	else
		# As no graphics system is chosen, we default to sdl
		ewarn "No graphics system is chosen."
		elog "sdl-gfx has been enabled as the default system"
		myconf="${myconf} --with-sdl-gfx --without-curses"
		needSDL=$((needSDL+1))
		if use sdl-gl ; then
			myconf="${myconf} --with-sdl-gl"
		fi
	fi

	# JIT can only be used with x86
	if use x86 ; then
		myconf="${myconf} \
			$(use_enable jit) \
			$(use_enable natmem) \
			$(use_enable noflags)"
	else
		myconf="${myconf} --disable-jit --disable-natmem --disable-noflags"
		use jit &&	elog "JIT is only available on x86 platforms and has been deactivated."
	fi

	# If we use audio, alsa comes first, then sdl (like in configure.in)
	if use audio ; then
		if use alsa ; then
			myconf="${myconf} --enable-audio --without-sdl-sound"
			myconf="${myconf} --with-alsa"
			elog "alsa is chosen for audio output"
			use sdl-sound && elog "--> sdl-sound USE flag ignored"
		elif use sdl-sound ; then
			needSDL=$((needSDL+1))
			myconf="${myconf} --enable-audio --with-sdl-sound"
			myconf="${myconf} --without-alsa"
			elog "sdl-sound is chosen for audio output"
		else
			ewarn "audio is enabled, but neither alsa nor sdl-sound"
			ewarn "selected. Defaulting to alsa."
			myconf="${myconf} --enable-audio --without-sdl-sound"
			myconf="${myconf} --with-alsa"
		fi
	else
		myconf="${myconf} --disable-audio --without-sdl-sound"
		myconf="${myconf} --without-alsa"
	fi

	# We need to determine whether SDL is used for the low level
	# functionality to determine, whether sdl has to be tested:
	if use sdl ; then
		needSDL=$((needSDL+1))
		myconf="${myconf} --with-sdl"
	fi

	# Need sdl test programs?
	if [ ${needSDL} -gt 0 ] ; then
		myconf="${myconf} --enable-sdltest"
	else
		myconf="${myconf} --disable-sdltest"
	fi

	# And now go for it:
	econf \
		$(use_enable profiling) \
		$(use_enable a2065) \
		$(use_enable a2091) \
		$(use_enable amax) \
		$(use_enable cdtv) \
		$(use_enable cd32) \
		$(use_enable debugger) \
		$(use_enable drvsnd) \
		$(use_enable enforcer) \
		$(use_enable gayle) \
		$(use_enable fpu) \
		$(use_enable ncr) \
		$(use_enable scsi-device) \
		$(use_enable save-state) \
		$(use_enable xarcade) \
		--enable-bsdsock \
		${myconf} || die "econf failed"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"

	dodoc CHANGES COPYING README docs/*

	# Finally tell the user that he has to set up kick rom path and 
	# file first, or the gui will close on itself.
	elog "Before the UI can be used, a configuration file"
	elog "~/.uaerc has to be created with at least two"
	elog "settings:"
	elog "unix.rom_path=<path to where your rom file(s) are>"
	elog "kickstart_rom_file=\$(FILE_PATH)/<rom file to use>"
}
