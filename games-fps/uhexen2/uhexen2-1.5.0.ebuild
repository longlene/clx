# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils flag-o-matic toolchain-funcs versionator games

MY_PV=$(replace_version_separator 3 '-')
DATA_PV="1.20"
HW_PV="0.15"
MY_PN="hexen2"
DEMO_PV="1.11"

DESCRIPTION="Hexen II source port - Hammer of Thyrion"
HOMEPAGE="http://uhexen2.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_PN}source-${MY_PV}.tgz
	mirror://sourceforge/u${MY_PN}/gamedata-all-${DATA_PV}.tgz
	hexenworld? ( mirror://sourceforge/u${MY_PN}/hexenworld-pakfiles-${HW_PV}.tgz )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc ~x86"
IUSE="3dfx alsa asm cdda cdinstall debug dedicated demo dynamic gtk hexenworld
	lights midi mp3 opengl oss portals sdlaudio tools vorbis wave"

UIDEPEND=">=media-libs/libsdl-1.2.7
	3dfx? ( media-libs/glide-v3 )
	alsa? ( >=media-libs/alsa-lib-1.0.7 )
	midi? ( media-sound/timidity++ )
	opengl? ( virtual/opengl )"

# Launcher depends from GTK+ libs
LNCHDEPEND="gtk? ( x11-libs/gtk+:2 )"

RDEPEND="!games-fps/uhexen2-cvs
	${UIDEPEND}
	${LNCHDEPEND}
	cdinstall? ( games-fps/hexen2-data )
	portals? ( games-fps/hexen2-portals )
	demo? ( >=games-fps/hexen2-demodata-${DEMO_PV} )
	lights? ( games-fps/hexen2-lights )
	mp3? ( || ( media-libs/libmad
				media-sound/mpg123 ) )
	vorbis? ( media-libs/libogg
			media-libs/libvorbis )"
DEPEND="${UIDEPEND}
	${LNCHDEPEND}
	x86? ( asm? ( || ( >=dev-lang/nasm-2.09.10
		>=dev-lang/yasm-1.1.0 ) ) )"

S="${WORKDIR}/${MY_PN}source-${MY_PV}"
dir="${GAMES_DATADIR}/${MY_PN}"

pkg_setup() {
	games_pkg_setup
}

src_prepare() {
	cd "${S}"

	# Fix GUI launcher
	epatch "${FILESDIR}/${P}-h2launcher.patch"

	# Whether to use the demo directory
	local demo
	use demo && demo="/demo"

	# Use default basedir - has 2 variations
	sed -i \
		-e "s:parms.basedir = cwd;:parms.basedir = \"${dir}${demo}\";:" \
		-e "s:parms.basedir = \".\";:parms.basedir = \"${dir}${demo}\";:" \
		engine/{hexen2,hexen2/server,hexenworld/{client,server}}/sys_unix.c \
		|| die "sed sys_unix.c failed"

	# Change default sndspeed from 22050 to 44100,
	# to improve the quality/reliability (recommended especially for ALSA).
	sed -i -e "s:desired_speed = 22050:desired_speed = 44100:" \
		engine/h2shared/snd_dma.c \
		|| die "sed snd_dma.c failed"

	# Honour Portage CFLAGS also when debugging is enabled
	use debug && append-flags "-g2"
	for u in `grep -lr '\-g \-Wall' *`; do
		sed -i -e "s/^CFLAGS \:\= \-g \-Wall/CFLAGS \:\= ${CFLAGS}/" \
			${u} || die "sed ${u} failed"
	done

	if use demo ; then
		# Allow lightmaps in demo
		sed -i -e "s:!override_pack:0:" \
			hexen2/common.c || die "sed common.c demo failed"
	fi

	if use gtk ; then
		# Tweak the default games data dir for graphical launcher
		sed -i \
			-e "/int basedir_nonstd/s:= 0:= 1:" \
			-e "/game_basedir\[0\]/d" \
			launcher/config_file.c || die "sed config_file.c failed"
		# Tweak the default name for binary executables,if demo is enabled
		if use demo ; then
			sed -i -e "/BINARY_NAME/s:\"$:-demo\":" \
				launcher/games.h || die "sed games.h failed"
		fi
	fi

	rm -rf docs/{activision,COMPILE,COPYING,LICENSE,README.win32}
}

src_compile() {
	# Set all compile options
	local g_opts= c_opts=

	h2build="h2"
	hwbuild="hw"
	h2bin="hexen2"
	hwbin="hwcl"
	if use opengl; then
		h2build="gl${h2build}"
		hwbuild="gl${hwbuild}"
		h2bin="gl${h2bin}"
		hwbin="gl${hwbin}"
	fi

	use debug && g_opts+=" DEBUG=1"
	use demo && g_opts+=" DEMO=1"

	use 3dfx && c_opts+=" USE_3DFX=yes"
	use alsa || c_opts+=" USE_ALSA=no"
	use cdda || c_opts+=" USE_CDAUDIO=no"
	use dynamic && c_opts+=" LINK_GL_LIBS=yes"
	use mp3 || c_opts+=" USE_CODEC_MP3=no"
	use oss || c_opts+=" USE_OSS=no"
	use sdlaudio || c_opts+=" USE_SDLAUDIO=no"
	use midi || c_opts+=" USE_MIDI=no"
	use vorbis || c_opts+=" USE_CODEC_VORBIS=no"
	use wave || c_opts+=" USE_CODEC_WAVE=no"


	if use mp3; then
		if has_version media-sound/mpg123 && ! has_version media-libs/libmad; then
			c_opts+=" MP3LIB=mpg123"
		fi
	fi

	if use x86; then
		if use asm; then
			if has_version dev-lang/yasm && ! has_version dev-lang/nasm; then
				c_opts+=" NASM=yasm"
			fi
		else
			c_opts+=" USE_X86_ASM=no"
		fi
	fi

	if use gtk ; then
	# Build launcher
		cd "${S}/launcher"
		einfo "\nBuilding graphical launcher"
		emake \
			${g_opts} \
			CPUFLAGS="${CFLAGS}" \
			|| die "emake launcher failed"
	fi

	if use tools ; then
		# Build Hexen2 utils
		cd "${S}/utils"
		einfo "nBuilding utils"
		local utils_list="hcc qfiles pak genmodel maputils dcc jsh2color texutils/bsp2wal texutils/lmp2pcx"
		for x in ${utils_list}
		do
			emake -C ${x} \
				${g_opts} \
				CPUFLAGS="${CFLAGS}" \
				|| die "emake ${x} failed"
		done
	fi

	if use dedicated ; then
		# Dedicated Server
		cd "${S}/engine/${MY_PN}"
		einfo "\nBuilding Dedicated Server"
		emake \
			${g_opts} \
			CPUFLAGS="${CFLAGS}" \
			-f Makefile.sv \
			|| die "emake Dedicated server failed"
	fi

	if use hexenworld ; then
		if use tools; then
			# Hexenworld utils
			local hw_utils="hwmaster hwmquery hwrcon"
			einfo "\nBuilding Hexenworld utils"
			cd "${S}/hw_utils"
			for x in ${hw_utils} ; do
				emake \
					${g_opts} \
					CPUFLAGS="${CFLAGS}" \
					-C ${x} \
					|| die "emake ${x} failed"
			done
		fi

		# Hexenworld
		einfo "\nBuilding Hexenworld servers"
		cd "${S}"/engine/hexenworld
		# Hexenworld servers
		emake \
			${g_opts} \
			CPUFLAGS="${CFLAGS}" \
			-C server \
			|| die "emake HexenWorld Server failed"

		# Hexenworld client
		einfo "\nBuilding Hexenworld client(s)"
		emake -C client clean
		emake \
			${g_opts} \
			${c_opts} \
			CPUFLAGS="${CFLAGS}" \
			${hwbuild} \
			-C client \
			|| die "emake Hexenworld Client (${hwbuild}) failed"
	fi

	# Hexen 2 game executable
	cd "${S}/engine/${MY_PN}"

	einfo "\nBuilding UHexen2 game executable(s)"
	emake clean
	emake \
		${g_opts} \
		${c_opts} \
		CPUFLAGS="${CFLAGS}" \
		${h2build} \
		|| die "emake Hexen II (${h2build}) failed"
}

src_install() {
	local demo demo_title demo_suffix
	use demo && demo="-demo" && demo_title=" (Demo)" && demo_suffix="demo"

	newicon engine/resource/h2_32x32x4.png ${PN}.png || die

	make_desktop_entry "${MY_PN}${demo}" "Hexen 2${demo_title}" ${PN}
	newgamesbin "engine/${MY_PN}/${h2bin}" "${MY_PN}${demo}" \
		|| die "newgamesbin engine/${h2bin} failed"

	if use dedicated ; then
		newgamesbin "engine/${MY_PN}/h2ded" "${MY_PN}${demo}-ded" \
			|| die "newgamesbin h2ded failed"
	fi

	if use hexenworld ; then
		if use tools; then
			# Hexenworld utils
			dobin hw_utils/hwmaster/hwmaster || die "dobin hwmaster failed"
			dobin hw_utils/hwmquery/hwmquery || die "dobin hwmquery failed"
			dobin hw_utils/hwrcon/{hwrcon,hwterm} || die "dobin hwrcon/hwterm failed"

			dodoc hw_utils/hwmquery/hwmquery.txt || die "dodoc hwmquery.txt failed"
			dodoc hw_utils/hwrcon/{hwrcon,hwterm}.txt \
			|| die "dodoc hwrcon/hwterm.txt failed"
		fi

		# Hexenworld Servers
		newgamesbin engine/hexenworld/server/hwsv hwsv${demo} \
			|| die "newgamesbin hwsv failed"

		# HexenWorld client(s)
		newicon engine/resource/hw2_32x32x8.png hwcl.png || die

		make_desktop_entry \
			"hwcl${demo}" "Hexen 2${demo_title} Hexenworld Client" hwcl
		newgamesbin "engine/hexenworld/client/${hwbin}" "hwcl${demo}" \
			|| die "newgamesbin ${hwbin} failed"


		insinto "${dir}"/${demo_suffix}
		doins -r "${WORKDIR}"/hw || die "doins hexenworld pak failed"
	fi

	if use gtk ; then
		# GTK launcher
		local lnch_name="h2launcher"
		use demo && lnch_name="h2demo"
		newgamesbin launcher/${lnch_name} h2launcher \
			|| die "newgamesbin h2launcher failed"
		make_desktop_entry \
			"h2launcher" "Hexen 2${demo_title} Launcher" ${PN}
	fi

	dodoc docs/*

	if ! use demo ; then
		# Install updated game data
		insinto "${dir}"
		doins -r "${WORKDIR}"/{data1,portals,siege} || die
		dodoc "${WORKDIR}"/*.txt
	fi

	if use tools ; then
		dobin \
			utils/bin/* \
			|| die "dobin utils failed"
		docinto utils
		dodoc utils/README || die "dodoc README failed"
		newdoc utils/dcc/README README.dcc || die "newdoc dcc failed"
		dodoc utils/dcc/dcc.txt || die "dodoc dcc.txt failed"
		newdoc utils/hcc/README README.hcc || die "newdoc hcc failed"
		newdoc utils/jsh2color/README README.jsh2color \
			|| die "newdoc README.jsh2color failed"
		newdoc utils/jsh2color/ChangeLog ChangeLog.jsh2color \
			|| die "newdoc Changelog.jsh2color failed"
	fi

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	if use demo ; then
		elog "uhexen2 has been compiled specifically to play the demo maps."
		elog "Example command-line:"
		elog "   ${MY_PN}-demo -width 1024 -height 768 -conwidth 640"
		elog
	else
		elog "To play the demo, emerge with the 'demo' USE flag."
		elog
		if ! use cdinstall; then
			elog "You must install the game data files before playing."
			elog "This can be done using games-fps/hexen2-data, or you may manually copy the"
			elog "v1.11 patched pak0.pak and pak1.pak files to ${dir}"
			elog
		fi
		if ! use portals; then
			elog "You must install games-fps/hexen2-portals in order to play the"
			elog "Portal of Praevus expansion pack, or you may manually copy the"
			elog "pak3.pak file to ${dir}"
			elog
		fi
		elog "To play Hexen II, run: ${MY_PN}"
		elog "To play Portal of Praevus (if installed), run: ${MY_PN} -portals"
		elog
		elog "Run '${MY_PN} -help' for additional options"
		elog
	fi
	if use gtk ; then
		elog "You've also installed a graphical launcher.  To use, run: h2launcher"
		elog
	fi
	if use tools ; then
		if use hexenworld; then
			elog "You've also installed some Hexenworld utilities:"
			elog
			elog " - hwmquery (console app to query HW master servers)"
			elog " - hwrcon (remote interface to HW rcon command)"
			elog " - hwterm (HW remote console terminal)"
			elog
		fi
		elog "You've also installed some Hexen2 utilities"
		elog "(useful for mod developing)"
		elog
		elog " - dhcc (old progs.dat compiler/decompiler)"
		elog " - genmodel (3-D model grabber)"
		elog " - hcc (HexenC compiler)"
		elog " - hcc_old (old version of HexenC compiler)"
		elog " - jsh2color (light colouring utility)"
		elog " - maputils (Map compiling tools: bspinfo, light, qbsp, vis)"
		elog " - qfiles (build pak files and regenerate bsp models)"
		elog " - bsp2wal (extract all textures from a bsp file)"
		elog " - lmp2pcx (convert hexen2 texture data into pcx and tga)"
		elog
		elog "See relevant documentation for further informations"
		elog
	fi
}
