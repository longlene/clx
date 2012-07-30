# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit games

DESCRIPTION="Dwarf Fortress is a single-player fantasy game. You can control a
dwarven outpost or an adventurer in a randomly generated, persistent world."
HOMEPAGE="http://www.bay12games.com/dwarves"

MY_P="df"
MY_PV="28_181_40d16"
BINPATCH_URI="http://brage.info/~svein/df-40d16-head.tar.bz2"
SRC_URI="http://www.bay12games.com/dwarves/${MY_P}_${MY_PV}_linux.tar.bz2 ${BINPATCH_URI}
		dfg? ( http://mayday.w.staszic.waw.pl/~mayday/upload/DFG21.zip )"
LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="dfg"

RESTRICT="nomirror"

RDEPEND="x11-libs/gtk+:2
		media-libs/libsdl
		media-libs/sdl-image
		virtual/opengl
		virtual/glu
		amd64? ( app-emulation/emul-linux-x86-sdl
			>=app-emulation/emul-linux-x86-baselibs-20081109
			app-emulation/emul-linux-x86-xlibs
			app-emulation/emul-linux-x86-gtklibs )"
DEPEND="${RDEPEND}
		dfg? ( app-arch/unzip 
			app-text/dos2unix )"

S="${WORKDIR}/df_linux"
dir="${GAMES_PREFIX_OPT}/${PN}"

src_unpack() {
	unpack ${MY_P}_${MY_PV}_linux.tar.bz2
	if [[ -n ${BINPATCH_URI} ]]; then
		# get filename from url
		local patchfile=`echo "${BINPATCH_URI}" | awk '{ split($0,a,"/"); print a[length(a)] }'`
		unpack $patchfile
	fi
	if use dfg ; then 
		unpack DFG21.zip
		rm -r ${S}/raw
		mv ${WORKDIR}/raw ${S}/
		mv -n ${WORKDIR}/data/art/* ${S}/data/art/
		dos2unix "${WORKDIR}/data/init/"{init.txt,embark_profiles.txt}
		mv -f "${WORKDIR}/data/init/"{init.txt,embark_profiles.txt} ${S}/data/init/
	fi
}

src_install() {
	# create launch script and install it
	echo -e "#!/bin/sh\ncd ${dir}\n./dwarfort.exe \$*\nchmod -R 770 ${GAMES_STATEDIR}/dwarfort/*\nchgrp -R games ${GAMES_STATEDIR}/dwarfort/*" > dwarfort
	exeinto "${GAMES_BINDIR}"
	doexe dwarfort
	rm dwarfort
	
	# install settings 
	mv data/init dwarfort
	insinto "${GAMES_SYSCONFDIR}"
	doins -r dwarfort 
	rm -r dwarfort

	# install save folder
	mkdir dwarfort
	insinto "${GAMES_STATEDIR}"
	doins -r dwarfort

	insinto "${dir}"
	doins -r raw data
	exeinto "${dir}"
	doexe dwarfort.exe

	# install libs, docs
	dolib.so libs/libfmodex.so libs/libgraphics.so
	dodoc *.txt README.linux

	# create symlinks for moved dirs
	dosym ${GAMES_SYSCONFDIR}/dwarfort ${dir}/data/init
	dosym ${GAMES_STATEDIR}/dwarfort ${dir}/data/save

	# fix permissions
	prepgamesdirs
	chmod -R 770 "${D}/${GAMES_STATEDIR}/dwarfort"
	chmod 770 "${D}/${dir}/data/index"
	chmod -R 770 "${D}/${dir}/data/"{announcement,dipscript,help}
}
pkg_postinst() {
	games_pkg_postinst
	elog "--------------------------------------------------------"
	elog "You may wish to tweak different configuration options in ${GAMES_SYSCONFDIR}/dwarfort/init.txt"
	elog "--------------------------------------------------------"
	elog "Game launcher is installed to ${GAMES_BINDIR}/dwarfort"
	elog "--------------------------------------------------------"
	elog "The discussion of this version of Dwarf Fortress can be found here:"
	elog "http://www.bay12games.com/forum/index.php?PHPSESSID=245f2618e2533729d2861e7f72b02164&topic=40349"
	elog "--------------------------------------------------------"
	if use dfg; then
		elog "You installed \"The Mike Mayday graphics edition (DFG)\" of Dwarf Fortress"
		elog "more info here: http://mayday.w.staszic.waw.pl/df.php"
		elog "--------------------------------------------------------"
	fi

}
