# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils games

MY_PN="${PN//-/_}"

DESCRIPTION="Amnesia: The Dark Descent is a first person survival horror. A game about immersion, discovery and living through a nightmare."
HOMEPAGE="http://www.amnesiagame.com"
SRC_URI="http://www.thedarkswarm.com/downloads/demo/${MY_PN}_${PV}.sh"

RESTRICT="mirror strip"
LICENSE="Frictional_Games-EULA"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc linguas_de linguas_en linguas_es linguas_fr linguas_it"

DEPEND="app-arch/xz-utils"
RDEPEND="media-libs/freealut
	media-libs/glew
	media-libs/jpeg:62
	media-libs/libogg
	media-libs/libvorbis
	media-libs/libpng:1.2
	media-libs/libtheora
	media-libs/openal
	media-libs/sdl-image
	media-libs/sdl-ttf
	sys-libs/zlib
	x11-libs/fltk:1.1
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libxcb
	x11-libs/libXdmcp
	x11-libs/libXext
	virtual/glu
	virtual/opengl"

S="${WORKDIR}/${PN}"

GAMEDIR="${GAMES_PREFIX_OPT}/${PN}"

src_unpack() {
	mkdir "tmp" || die "mkdir \"tmp\" failed"
	cd "./tmp" || die "cd \"tmp\" failed"

	unpack_makeself || die "unpack_makeself failed"

	mv "subarch" "installer.tar.lzma" || die "move \"subarch\" failed"
	unpack "./installer.tar.lzma" || die "unpack \"installer.tar.lzma\" failed"

	mv "instarchive_all" "../${P}.tar.lzma" || die "move \"instarchive_all\" failed"
	if use amd64
	then
		mv "instarchive_all_x86_64" "../${P}-amd64.tar.lzma" || die "move \"instarchive_all_x86_64\" failed"
	fi
	if use x86
	then
		mv "instarchive_all_x86" "../${P}-x86.tar.lzma" || die "move \"instarchive_all_x86\" failed"
	fi
	mv "icon.xpm" "../${PN}.xpm"

	cd "${WORKDIR}" || die "cd \"${WORKDIR}\" failed"
	unpack ./*.tar.lzma || die "unpack failed"
	mv "AmnesiaDemo" "${PN}" || die "mv \"AmnesiaDemo\" failed"

	rm ./*.tar.lzma
	rm -r "./tmp"
}

src_prepare() {
	# Files to remove.
	REMOVE="libs*/all
		Amnesia.png
		AmnesiaPDF.png
		checklibs*.sh"

	# Collect infos about languages...
	LINGUAS_ARRAY=()
	LANG_ARRAY=()
	LANGUAGE_ARRAY=()
	USE_ARRAY=()
	DEF_ARRAY=()
	DOC_ARRAY=()

	local linguas_def="0"
	local linguas_in_use="0"
	for use in ${IUSE}
	do
		if [[ "${use%%_*}" == "linguas" ]]
		then
			local tmp="${use}"
			LINGUAS_ARRAY=(${LINGUAS_ARRAY[@]} "${tmp}")

			tmp="${tmp##linguas_}"
			LANG_ARRAY=(${LANG_ARRAY[@]} "${tmp}")

			case "${tmp}" in
			    "de") tmp="german";;
			    "en") tmp="english";;
			    "es") tmp="spanish";;
			    "fr") tmp="french";;
			    "it") tmp="italian";;
			    *) tmp="";;
			esac
			LANGUAGE_ARRAY=(${LANGUAGE_ARRAY[@]} "${tmp}")

			if use ${use}
			then
				USE_ARRAY=(${USE_ARRAY[@]} "1")

				case "${use}" in
					"linguas_${LANG:0:2}") DEF_ARRAY=(${DEF_ARRAY[@]} "2"); linguas_def="2";;
					"linguas_en") DEF_ARRAY=(${DEF_ARRAY[@]} "1"); linguas_def="$(( ${linguas_def:-0} < 2 ? 1 : 2 ))";;
					*) DEF_ARRAY=(${DEF_ARRAY[@]} "0");;
				esac

				if use doc
				then
					DOC_ARRAY=(${DOC_ARRAY[@]} "1")
				else
					DOC_ARRAY=(${DOC_ARRAY[@]} "0")
				fi

				linguas_in_use="$(( ${linguas_in_use} + 1 ))"
			else
				USE_ARRAY=(${USE_ARRAY[@]} "0")
				DEF_ARRAY=(${DEF_ARRAY[@]} "0")
				DOC_ARRAY=(${DOC_ARRAY[@]} "0")
			fi
		fi
	done

	# ...then process them.
	local n="0"
	local linguas_set="0"
	while [[ "${n}" -lt "${#LINGUAS_ARRAY[@]}" ]]
	do
		if [[ "${USE_ARRAY[${n}]}" != "1" ]]
		then
			# If no linguas keep at least english.
			if [[ "${linguas_in_use}" == "0" && "${LINGUAS_ARRAY[${n}]}" == "linguas_en" ]]
			then
				if use doc
				then
					DOC_ARRAY[${n}]="1"
				fi
			else
				REMOVE="${REMOVE} config/base_${LANGUAGE_ARRAY[${n}]}.lang config/lang_main/${LANGUAGE_ARRAY[${n}]}.lang"
			fi
		else
			# Prefer languages in this order: system lang - english - first of others. Don't change anything if english (linguas_def == 1).
			if [[ "${DEF_ARRAY[${n}]}" == "${linguas_def}" && "${linguas_def}" != "1" && "${linguas_set}" != "1" ]]
			then
				sed -e "s#english.lang#${LANGUAGE_ARRAY[${n}]}.lang#g" \
				    -i "./config/main_init.cfg" || die "sed \"./config/main_init.cfg\" failed"

				linguas_set="1"
			fi
		fi

		if [[ "${DOC_ARRAY[${n}]}" != "1" ]]
		then
			REMOVE="${REMOVE} EULA_${LANG_ARRAY[${n}]}.rtf Manual_${LANG_ARRAY[${n}]}.pdf"
		fi

		n="$(( ${n} + 1 ))"
	done

	einfo " Removing useless files ..."
	for remove in ${REMOVE}
	do
		rm -r "${S}/"${remove} || die "rm \"${remove}\" failed"
	done

	if use amd64
	then
		mv "Amnesia.bin64" "Amnesia.bin" || die "mv \"Amnesia.bin64\" failed"
		mv "Launcher.bin64" "Launcher.bin" || die "mv \"Launcher.bin64\" failed"
	fi
}

src_install() {
	# Install data
	insinto "${GAMEDIR}" || die "insinto \"${GAMEDIR}\" failed"

	einfo " Installing game data files ..."
	for directory in $(find * -maxdepth 0 -type d ! -name libs*)
	do
		doins -r ${directory} || die "doins game data files failed"
	done

	doins *.cfg || die "doins \".cfg\" files failed"


	# Install libraries and executables
	einfo " Installing libraries and executables ..."
	if use amd64
	then
		local libsdir="${GAMEDIR}/libs64"
	fi
	if use x86
	then
		local libsdir="${GAMEDIR}/libs"
	fi

	exeinto "${libsdir}" || die "exeinto \"${libsdir}\" failed"
	doexe libs*/* || die "doexe \"libs\" failed"

	exeinto "${GAMEDIR}" || die "exeinto \"${GAMEDIR}\" failed"
	doexe *.bin || die "doexe \".bin\" binaries failed"


	# Make game wrapper
	mkdir -p "${D}/${GAMES_BINDIR}" || die "mkdir \"${D}/${GAMES_BINDIR}\" failed"

	local wrapper="${D}/${GAMES_BINDIR}/${PN}"
	touch "${wrapper}" || die "touch \"${wrapper}\" failed"

	cat << EOF >> "${wrapper}" || die "echo failed"
#!/bin/sh
cd "${GAMEDIR}"
if [[ -w "\${HOME}/.frictionalgames/Amnesia/MainDemo/main_settings.cfg" ]]
then
  exec ./Amnesia.bin "\${@}"
else
  exec ./Launcher.bin "\${@}"
fi
EOF


	# Install icon and desktop file
	doicon "../${PN}.xpm" || die "newicon \"icon.xpm\" failed"
	make_desktop_entry "${PN}" "Amnesia: The Dark Descent - Demo" || die "make_desktop_entry failed"


	# Install documentation
	if use doc
	then
		docinto ${PN}
		dodoc *.rtf *.pdf || die "dodoc failed"
	fi


	# Setting permissions.
	einfo " Setting permissions ..."
	prepgamesdirs
}

pkg_postinst() {
	ewarn ""
	ewarn "Amnesia: The Dark Descent needs video drivers"
	ewarn "that provide a complete GLSL 1.20 implementation."
	ewarn ""
	ewarn "Please visit \"http://www.frictionalgames.com/forum/thread-3760.html\""
	ewarn "for more infos."
	ewarn ""
	ewarn "--------------------------------------------------------------------"
	ewarn ""
	ewarn "If you was playing version 1.0 you might experience some oddities"
	ewarn "due to save game differences between 1.0 and 1.0.1."
	ewarn ""
}
