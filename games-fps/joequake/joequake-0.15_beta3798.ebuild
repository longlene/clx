# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils toolchain-funcs flag-o-matic games

MY_PV="${PV/_beta/b}"
MY_SRC="${PN}-v${MY_PV}-source.zip"
MY_URL="http://runecentral.com/${PN}"
MY_WINDOWS="${PN}-v${MY_PV}-win32.zip"
MY_WAD="${PN}_wad.zip"
MY_HIPNOTIC="hipnotic_wad.zip"
MY_LIGHTS="fuhquake-lits.rar"

DESCRIPTION="Improved Quake 1 engine with ZQuake and FuhQuake graphical effects"
HOMEPAGE="http://www.runecentral.com/joequake/"
SRC_URI="${MY_URL}/${MY_SRC}
	${MY_URL}/${MY_WAD}
	${MY_URL}/${MY_WINDOWS}
	soa? ( ${MY_URL}/${MY_HIPNOTIC} )
	lights? ( http://www.fuhquake.net/files/extras/${MY_LIGHTS} )"

LICENSE="GPL-2"
SLOT="0"
# Broken on amd64 - http://forums.gentoo.org/viewtopic-t-398434.html
KEYWORDS="-* ~x86"
# Info at http://www.freebsd.org/cgi/cvsweb.cgi/ports/games/joequake/Makefile
# Is not compatible with the demo data.
IUSE="cdinstall cdsound doe lights skins soa textures"

UIDEPEND="media-libs/jpeg
	media-libs/libpng
	virtual/opengl
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libXdmcp
	x11-libs/libXext
	x11-libs/libXxf86dga
	x11-libs/libXxf86vm"
RDEPEND="${UIDEPEND}
	cdinstall? ( games-fps/quake1-data )
	doe? ( games-fps/quake1-doe )
	skins? ( games-fps/quake1-skins )
	soa? ( games-fps/quake1-soa )
	textures? ( >=games-fps/quake1-textures-20050820 )"
DEPEND="${UIDEPEND}
	lights? ( || (
			app-arch/unrar
			app-arch/rar ) )
	app-arch/unzip"

S=${WORKDIR}/src
dir=${GAMES_DATADIR}/quake1

QA_EXECSTACK=${GAMES_BINDIR:1}/${PN}

src_unpack() {
	# Windows file is needed for pak0.pak and docs
	unpack "${MY_WINDOWS}"
	unpack "${MY_SRC}"
	rm *.exe ${PN}/*.dll

	mkdir -p ${PN}/textures
	cd ${PN}/textures
	unpack "${MY_WAD}"

	if use soa ; then
		mkdir hipnotic
		cd hipnotic
		unpack "${MY_HIPNOTIC}"
		mv wad/* .
		rmdir wad
	fi

	if use lights ; then
		cd "${WORKDIR}"/${PN}
		mkdir lits
		cd lits
		unpack "${MY_LIGHTS}"
	fi

	cd "${S}"

	mv -f Makefile{.linux,}

	# Only additional CFLAGS optimization is the -march flag
	local march=$(get-flag -march)
	sed -i \
		-e "s:-march=pentiumpro:${march}:" \
		Makefile || die "sed Makefile"

	if [[ "$(gcc-fullversion)" == "4.1.1" ]] ; then
		# Need -O0 to stop audio crackling
		sed -i \
			-e "s:-O1:-O0:" \
			Makefile || die "sed Makefile -O0"
	else
		# No need to force -O1
		sed -i \
			-e "s:-O1::" \
			Makefile || die "sed Makefile -O1"
	fi

	# Use ~/.joequake/config.cfg
	sed -i \
		-e "s:com_argv\[i+1\]));:com_argv\[i+1\]));\n\n\tmkdir (va(\"%s/%s\", getenv (\"HOME\"), \".${PN}\"), 0755);\n\tCOM_AddGameDirectory (va(\"%s/%s\", getenv (\"HOME\"), \".${PN}\"));:" \
		common.c || die "sed common.c"

	# Set shared directories.
	# Change default "-mem" parameter to cope with large maps.
	# 128mb is the default in the "qrack" Quake 1 engine.
	sed -i \
		-e "s:basedir = \".\":basedir = \"${dir}\":" \
		-e "s:parms.memsize = 16:parms.memsize = 128:" \
		sys_linux.c || die "sed sys_linux.c"

	# Save *all* the cvars by default, to easily edit config.cfg
	sed -i \
		-e "s:savevars\", \"0:savevars\", \"2:" \
		cvar.c || die "sed cvar.c"

	if ! use cdsound ; then
		# Turn the CD accesses off
		sed -i \
			-e "s:/dev/cdrom:/dev/null:" \
			-e 's:COM_CheckParm("-nocdaudio"):1:' \
			cd_linux.c || die "sed cd_linux.c"
	fi

	# Use native libs
	local f ref
	for f in jconfig jmorecfg jerror jpeglib png pngconf ; do
		ref="/usr/include/${f}.h"
		sed -i \
			-e "s:\"${f}.h\":\<${ref}\>:" \
			-e "s:\"jpeg-linux/${f}.h\":\<${ref}\>:" \
			*.c \
			|| die "sed ${f} libs"
		rm -f "${f}.h"
	done

	# For version 1862 to compile
	sed -i \
		-e "s:gl_draw:gl_decals gl_draw:" \
		Makefile || die "sed Makefile"

	sed -i \
		-e "s:gl_have_stencil \&\&:0 \&\&:" \
		gl_rmain.c || die "sed gl_rmain.c"

	sed -i \
		-e "s:= _strdup:= strdup:" \
		zone.c || die "sed zone.c"
}

src_compile() {
	emake \
		Q1DIR="${dir}" \
		LOCALBASE=/usr \
		glx \
		|| die "emake"
}

src_install() {
	newgamesbin release_glx/${PN}-gl.glx ${PN} \
		|| die "newgamesbin opengl"

	insinto "${dir}"
	doins -r "${WORKDIR}/${PN}" || die "doins ${PN}"
	rm -rf "${D}/${dir}/${PN}/doc"

	if use cdinstall ; then
		make_desktop_entry ${PN} "JoeQuake" ${PN}.png
	fi
	if use doe ; then
		games_make_wrapper ${PN}-doe "${PN} -rogue"
		make_desktop_entry ${PN}-doe "JoeQuake - Dissolution of Eternity" ${PN}.png
	fi
	if use soa ; then
		games_make_wrapper ${PN}-soa "${PN} -hipnotic"
		make_desktop_entry ${PN}-soa "JoeQuake - Scourge of Armagon" ${PN}.png
	fi

	dodoc "${WORKDIR}/${PN}/doc"/*

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	elog "To run the game conveniently,"
	elog "set up a ~/bin/joequake script containing e.g.:"
	elog
	# This is the correct way of setting the sound speed in JoeQuake
	elog "exec ${GAMES_BINDIR}/${PN} -nokdga -width 1024 -height 768 -fullscreen -bpp 32 +set s_khz 44 \$@"
	echo
}
