# Copyright 1999-2010 [v-fox] ftp://dfx.homeftp.net/services/GENTOO/v-fox
# Distributed under the terms of the GNU General Public License v2 or later

inherit eutils toolchain-funcs flag-o-matic toolchain-funcs games

EAPI="2"
MY_PN="quake2"
FILE_STEM="KMQuake2-SDL-${PV}_src_unix"
DATA_STEM="KMQuake2_data-0.19"
QUDOS_SRC="http://qudos.quakedev.com/linux/quake2"

DESCRIPTION="Enhanced Quake 2 engine with Lazarus mod support"
HOMEPAGE="http://qexpo2005.quakedev.com/booths.php?tag=knightmare
	http://qudos.quakedev.com/"
SRC_URI="${QUDOS_SRC}/engines/KMQuake2/${FILE_STEM}.tar.bz2
	${QUDOS_SRC}/engines/KMQuake2/${DATA_STEM}.tar
	http://kmq2.quakedev.com/files/kmquake2_020_lvlshots_hi.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="alsa audacious cdinstall cdsound debug dedicated demo dga maps +models mods opengl oss custom-cflags sdl textures"

UIRDEPEND="audacious? ( media-sound/audacious )
	dga? ( x11-libs/libXxf86dga )
	sdl? ( media-libs/libsdl )
	textures? ( >=games-fps/quake2-textures-2[-kmquake2]
		models? ( >=games-fps/quake2-textures-2[-models] ) )
	virtual/opengl
	virtual/glu
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXxf86vm"
UIDEPEND="${UIRDEPEND}
	x11-proto/xf86dgaproto
	x11-proto/xf86vidmodeproto
	x11-proto/xproto"
RDEPEND="opengl? ( ${UIRDEPEND} )
	!opengl? ( sdl? ( ${UIRDEPEND} ) )
	cdinstall? ( games-fps/quake2-data )
	demo? ( games-fps/quake2-demodata )
	maps? ( games-fps/kmquake2-shanmaps )
	mods? ( games-fps/kmquake2-mods )"
DEPEND="opengl? ( ${UIDEPEND} )
	!opengl? ( sdl? ( ${UIDEPEND} ) )
	alsa? ( media-libs/alsa-lib )
	media-libs/openal
	media-libs/jpeg
	media-libs/libogg
	media-libs/libpng
	media-libs/libvorbis
	app-arch/unzip"

S=${WORKDIR}/${FILE_STEM}

pkg_setup() {
	if ! use sdl && ! use opengl && ! use dedicated; then
		echo
		eerror "you should choose at least one video renderer:"
		eerror "'opengl' or 'sdl'"
		eerror "OR"
		eerror "add 'dedicated' USE-flag to build server"
		echo
		die "no video renderer chosen"
	fi

	if ! use alsa && ! use oss && ! use sdl && ! use dedicated; then
		echo
		eerror "you should choose at least one audio output:"
		eerror "'alsa' (not recommended), 'oss' (good) or 'sdl' (choppy cutscenes)"
		eerror "OR"
		eerror "add 'dedicated' USE-flag to build server"
		echo
		die "no audio output chosen"
	fi

	if use alsa; then
		echo
		ewarn "The ALSA sound driver for this game is incomplete."
		ewarn "The 'oss' USE-flag is recommended instead."
		echo
		epause 5
	fi


	# avoiding segfaults
	if ! use custom-cflags; then
			strip-flags
			replace-flags -O? -O0
	fi

	# gcc-4.1.1 hard workaround
	[[ "$(gcc-fullversion)" == "4.1.1" ]] && \
				replace-flags -O? -O0

	# Prevent potential for "signal 11"(segv) abort, requested by QuDos
	filter-flags -fomit-frame-pointer
}

src_prepare() {
	cd "${S}"

	# Fix jpeg8 bug - http://bugs.gentoo.org/show_bug.cgi?id=150865
	epatch "${FILESDIR}"/${PN}-${PV}-jpeg8.patch

	# Fix for amd64 - http://bugs.gentoo.org/show_bug.cgi?id=158415
	epatch "${FILESDIR}"/${PN}-${PV}-remaping_amd64.patch

	# Fix directory search for the game API
	epatch "${FILESDIR}"/${PN}-${PV}-search_path.patch

	# Now we can safely reemerge it and play further
	epatch 	"${FILESDIR}"/${PN}-${PV}-safe_saving.patch

	# Use alsa by default
	use alsa && \
	epatch "${FILESDIR}"/${PN}-${PV}-alsa.patch

	# Without cd-audio by default
	use cdsound || \
	epatch "${FILESDIR}"/${PN}-${PV}-nocd.patch

	# Fix build with libpng-1.4
	epatch "${FILESDIR}"/${P}-libpng14.patch

	rm gnu.txt
	mv "${WORKDIR}/${DATA_STEM}/${PN}.png" "${WORKDIR}"

	if use models;then
		einfo "using kmquake2's own player and weapon models"
		else
		einfo "deleting kmquake2's models so we could use external textures safely"
		rm -rf "${WORKDIR}/${DATA_STEM}"/baseq2/players || die
	fi
}

src_compile() {
	yesno() { useq $1 && echo YES || echo NO ; }

	emake \
		BUILD_DEDICATED=$(yesno dedicated) \
		BUILD_KMQUAKE2=$(yesno opengl) \
		BUILD_KMQUAKE2_SDL=$(yesno sdl) \
		WITH_AUDACIOUS=$(yesno audacious) \
		WITH_XMMS=NO \
		DATADIR="${GAMES_DATADIR}/${MY_PN}" \
		LIBDIR="$(games_get_libdir)/${PN}" \
		OPTIMIZE=NO \
		WITH_XF86_DGA=$(yesno dga) \
		LOCALBASE="/usr" \
		CC="$(tc-getCC)" \
		BUILD_DATADIR=YES \
		BUILD_LIBDIR=YES \
		$(use debug && echo debug || echo release) \
		|| die "emake failed"
}

src_install() {
	insinto "${GAMES_DATADIR}/${MY_PN}"
	doins -r "${WORKDIR}/${DATA_STEM}"/* "${WORKDIR}"/baseq2 \
		|| die "doins ${GAMES_DATADIR}/${MY_PN}/baseq2 failed"

	insinto "$(games_get_libdir)/${PN}"
	doins -r quake2/baseq2 \
		|| die "doins $(games_get_libdir)/${PN}/baseq2 failed"

	doicon "${WORKDIR}/${PN}.png" || die "doicon failed"

	use dedicated && \
		$(newgamesbin "${MY_PN}/${PN}_netserver" "${PN}-ded" || \
			die "failded to install server binary")

	use opengl && \
		$(dogamesbin "${MY_PN}/${PN}" && \
			make_desktop_entry "${PN}" "KM Quake 2" "${PN}.png" || \
			die "failed to install main client executable")

	use sdl && \
		$(dogamesbin "${MY_PN}/${PN}-sdl" && \
			make_desktop_entry "${PN}-sdl" "KM Quake 2 SDL" "${PN}.png" || \
			die "failed to install sdl client executable)")

	use demo && \
		$(games_make_wrapper "${PN}-demo" "${PN} +set game demo" && \
			make_desktop_entry "${PN}-demo" "KM Quake 2 (Demo)" "${PN}.png" ||
			die "failed to make demo wrapper")

	dodoc *.{txt,unix} || die "dodoc failed"
	prepgamesdirs
}
