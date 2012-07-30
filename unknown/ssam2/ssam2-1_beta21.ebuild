# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

MY_PV="2_1"
SZ="ftp://ftp.planetmirror.com/pub/seriouszone/general/misc"
GAME_FILE="ss_linuxbeta_rc_${MY_PV}_public.tar.gz"
DOC_FILE="sed2_help.tar.gz"

DESCRIPTION="Serious Sam 2 and Serious Editor 2"
HOMEPAGE="http://www.serioussam2.com/
	http://www.croteam.com/
	http://www.seriouszone.com/"
SRC_URI="${SZ}/${GAME_FILE}
	editor? ( ${SZ}/${DOC_FILE} )"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
# The dedicated server is ignored - does not yet work with GameSpy
IUSE="editor"
RESTRICT="mirror strip"

RDEPEND="virtual/opengl
	media-libs/openal"
DEPEND=""

S=${WORKDIR}
dir=${GAMES_PREFIX_OPT}/${PN}

pkg_setup() {
	games_pkg_setup

	cdrom_get_cds "Disk1/All_PC_03.gro"
}

src_install() {
	local n f p

	einfo "Copying from ${CDROM_ROOT} ..."
	insinto "${dir}"

	# This is valid for files located on one DVD disk.
	# Disk 5 is not on some DVD versions.
	for n in {1..5} ; do
		einfo "Copying from disk ${n} ..."
		for f in All_PC_0{1..3}.gro Movies_PC_0{1,2}.gro ; do
			p="${CDROM_ROOT}/Disk${n}/${f}"
			if [[ -f "${p}" ]] ; then
				doins "${p}" || die "doins ${p} failed"
			fi
		done

		for f in Bin Content ; do
			p="${CDROM_ROOT}/Disk${n}/${f}"
			if [[ -d "${p}" ]] ; then
				doins -r "${p}" || die "doins -r ${p} failed"
			fi
		done
	done

	# Check that critical files are copied
	for f in All_PC_0{1..3}.gro Movies_PC_0{1,2}.gro ; do
		[[ -f "${D}/${dir}/${f}" ]] || die "Required file ${f} not found"
	done
	for f in Bin Content ; do
		[[ -d "${D}/${dir}/${f}" ]] || die "Required directory ${f} not found"
	done

	exeinto "${dir}"
	doexe Run{Editor,Sam2} || die

	insinto "${dir}"
	doins -r Bin Content || die
	doins README || die

	exeinto "${dir}"/Bin/Linux-Dynamic-Release
	doexe Bin/Linux-Dynamic-Release/{DedicatedServer,Sam2,SeriousEditor2,*.so} || die

	keepdir "${dir}"/Content/SeriousSam2/PlayerProfiles
	mkdir "${D}/${dir}"/Temp
	touch "${D}/${dir}"/Temp/ConsoleHistory.txt || die

	# Remove useless Windows files
	rm -f "${D}/${dir}/Bin"/*.{exe,dll}
	rm -rf "${D}/${dir}"/Content/Installer

	games_make_wrapper ${PN} ./RunSam2 "${dir}" "${dir}"
	make_desktop_entry ${PN} "Serious Sam 2"

	if use editor ; then
		insinto "${dir}"
		doins -r SeriousEngineTools_Help || die

		games_make_wrapper ${PN}-editor ./RunEditor "${dir}" "${dir}"
		make_desktop_entry ${PN}-editor "Serious Sam 2 (Editor)"
	fi

	# Ensure that file datestamps from the CD are sane
	find "${D}/${dir}" -exec touch '{}' \;

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	# Need to be able to write
	chmod 770 "${dir}"/Content/SeriousSam2/{Demos,PlayerProfiles} || die
	chmod 660 "${dir}"/Content/SeriousSam2/Sam2.ini || die
	chmod 660 "${dir}"/Temp/ConsoleHistory.txt || die

	einfo "Security warnings during the emerge can be ignored."
	echo
	elog "Please view the README file for info about known limitations."
	elog
	elog "Important information about the Linux port is at:"
	elog " http://forums.seriouszone.com/showthread.php?t=49869"
	elog
	elog "To reset the mouse cursor after exiting the game, run:"
	elog " emerge xsetroot"
	elog " xsetroot -cursor_name left_ptr"
	echo
}
