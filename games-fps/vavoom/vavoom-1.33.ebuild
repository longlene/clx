# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

WX_GTK_VER="2.8"

inherit cmake-utils eutils wxwidgets games

DESCRIPTION="Advanced source port for Doom/Heretic/Hexen/Strife"
HOMEPAGE="http://www.vavoom-engine.com/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="allegro asm debug dedicated flac mad mikmod models music openal +sdl textures tools vorbis wxwidgets"

# Vavoom requires either Allegro or SDL to compile.
# Set appropriate USE flags to select which library is used.

# As of 1.33, OpenGL is required and thus forced on.

SDLDEPEND="
	|| ( >=media-libs/libsdl-1.2[alsa,X,opengl]
		>=media-libs/libsdl-1.2[oss,X,opengl] )
	music? ( media-libs/sdl-mixer )
	!music? ( media-libs/sdl-mixer[timidity] )
	"
ALLEGDEPEND="
	|| ( >=media-libs/allegro-4.0[alsa,X,opengl]
		>=media-libs/allegro-4.0[oss,X,opengl] )
	"
DEPEND="media-libs/libpng
	virtual/jpeg
	sdl? ( ${SDLDEPEND} )
	!sdl? ( allegro? ( ${ALLEGDEPEND} ) )
	vorbis? ( media-libs/libvorbis )
	flac? ( media-libs/flac )
	mad? ( media-libs/libmad )
	mikmod? ( media-libs/libmikmod )
	openal? ( media-libs/openal )
	wxwidgets? ( x11-libs/wxGTK:2.8 )"
RDEPEND="${DEPEND}
	allegro? ( media-sound/timidity++ )"
PDEPEND="models? ( >=games-fps/vavoom-models-1.4.3 )
	music? ( games-fps/vavoom-music )
	textures? ( games-fps/vavoom-textures )"

datadir=${GAMES_DATADIR}/${PN}

CMAKE_IN_SOURCE_BUILD=true

pkg_setup() {
	games_pkg_setup

	# Print some warning if needed
	if use sdl && use allegro ; then
		echo
		ewarn "Both 'allegro' and 'sdl' USE flags enabled. Using SDL as default."
	elif ! use sdl && ! use allegro && ! use dedicated ; then
		echo
		ewarn "Neither 'allegro' nor 'sdl' USE flags are enabled."
		ewarn "You must enable at least one.  SDL is the preferred default."
		echo
		die "No valid multimedia library enabled."
	fi
}

src_unpack() {
	unpack ${A}
	cd "${S}"

	# Got rid of icon installation
	sed -i \
		-e "/vavoom\.png/d" \
		source/CMakeLists.txt || die "sed CMakeLists.txt failed"

	# Set shared data directory
	sed -i \
		-e "s:fl_basedir = \".\":fl_basedir = \"${datadir}\":" \
		source/files.cpp || die "sed files.cpp failed"
}

src_compile() {
	local \
		with_allegro="-DWITH_ALLEGRO=OFF" \
		with_sdl="-DWITH_SDL=OFF" \
		with_opengl="-DWITH_OPENGL=ON" \
		with_vorbis=$(cmake-utils_use_with vorbis)

	# Sdl is the default, unless sdl=off & allegro=on
	if ! use sdl && use allegro ; then
		with_allegro="-DWITH_ALLEGRO=ON"
	# Only disable opengl for dedicated servers
	elif ! use sdl && ! use allegro && use dedicated ; then
		with_opengl="-DWITH_OPENGL=OFF"
	else
		with_sdl="-DWITH_SDL=ON"
	fi

	# Forcibly enable vorbis support if "music" USE flag is enabled
	if ! use vorbis && use music ; then
		ewarn "\"music\" USE flag requires Vorbis support enabled."
		ewarn "Forced enabling of \"vorbis\" USE flag"
		with_vorbis="-DWITH_VORBIS=ON"
	fi

	mycmakeargs="${mycmakeargs}
					-DCMAKE_CXX_FLAGS_RELEASE=-DNDEBUG
					-DCMAKE_CXX_FLAGS_DEBUG=-g2
					-DDATADIR=${datadir}
					-DBINDIR="${GAMES_BINDIR}"
					-DENABLE_CLIENT=ON
					-DENABLE_WRAPPERS=OFF
					${with_allegro}
					${with_sdl}
					${with_opengl}
					${with_vorbis}
					$(cmake-utils_use_with openal OPENAL)
					$(cmake-utils_use_with mad LIBMAD)
					$(cmake-utils_use_with mikmod MIKMOD)
					$(cmake-utils_use_with flac FLAC)
					$(cmake-utils_use_enable debug ZONE_DEBUG)
					$(cmake-utils_use_enable dedicated SERVER)
					$(cmake-utils_use_enable asm ASM)
					$(cmake-utils_use_enable wxwidgets LAUNCHER)
					-DwxWidgets_CONFIG_EXECUTABLE=${WX_CONFIG}"

	cmake-utils_src_configure

	cmake-utils_src_make -j1
}

src_install() {
	cmake-utils_src_install

	# Create desktop entry
	make_desktop_entry "${PN}" "Vavoom" || die "make_desktop_entry failed"
	doicon "source/${PN}.png" || die "doicon ${PN}.png failed"

	dodoc "docs/${PN}.txt" || die "dodoc vavoom.txt failed"

	if use tools ; then
		# The tools are always built
		dogamesbin utils/bin/{acc,fixmd2,vcc,vlumpy} || die "dobin utils failed"
		dodoc utils/vcc/vcc.txt || die "dodoc vcc.txt failed"
	fi

	if use wxwidgets ; then
		# Install graphical launcher shortcut
		doicon utils/vlaunch/vlaunch.xpm || die "doicon vlaunch.xpm failed"
		make_desktop_entry "vlaunch" "Vavoom Launcher" "vlaunch.xpm"
	fi

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	elog "Copy or link wad files into ${datadir}"
	elog "(the files must be readable by the 'games' group)."
	elog
	elog "Example setup:"
	elog "ln -sn "${GAMES_DATADIR}"/doom-data/doom.wad "${datadir}"/"
	elog
	elog "Example command-line:"
	elog "   vavoom -doom -openal"
	elog
	elog "See documentation for further details."

	if use wxwidgets ; then
		echo
		elog "You've also installed a nice graphical launcher. Simply run:"
		elog "   vlaunch"
		elog
		elog "to enjoy it :)"
	fi

	if use tools; then
		echo
		elog "You have also installed some Vavoom-related utilities"
		elog "(useful for mod developing):"
		elog
		elog " - acc (ACS Script Compiler)"
		elog " - fixmd2 (MD2 models utility)"
		elog " - vcc (Vavoom C Compiler)"
		elog " - vlumpy (Vavoom Lump utility)"
		elog
		elog "See the Vavoom Wiki at http://vavoom-engine.com/wiki/ or"
		elog "Vavoom Forum at http://www.vavoom-engine.com/forums/"
		elog "for further help."
	fi
}
