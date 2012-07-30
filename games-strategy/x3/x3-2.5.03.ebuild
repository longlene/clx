# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="Open-ended space opera with trading, building & fighting"
HOMEPAGE="http://www.linuxgamepublishing.com/info.php?id=x3"
SRC_URI="http://updatefiles.linuxgamepublishing.com/${PN}/${PN}-2.5-2.5.01-x86.run
	 http://updatefiles.linuxgamepublishing.com/${PN}/${PN}-2.5.01-2.5.02-x86.run
	 http://updatefiles.linuxgamepublishing.com/${PN}/${PN}-2.5.02-${PV}-x86.run
	 xtm? ( http://downloads.thexuniverse.us/downloads/XTM_0.7.5_Full.exe
		linguas_de? ( http://downloads.thexuniverse.us/downloads/german_TFiles_0.75b.zip )
		linguas_fr? ( http://downloads.thexuniverse.us/downloads/XTM7.5_French_Finale.rar ) )"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
LANGUAGES="linguas_de linguas_fr linguas_it"
IUSE="bonuspack cockpit ${LANGUAGES} modkit xtm"
RESTRICT="strip"
RDEPEND="
	media-libs/alsa-lib
	sys-libs/glibc
	amd64? (
		app-emulation/emul-linux-x86-gtklibs
		app-emulation/emul-linux-x86-sdl
	)
	x86? (
		media-libs/openal
		media-libs/libsdl
		sys-libs/zlib
		x11-libs/gtk+
		x11-libs/libX11
		x11-libs/libXau
		x11-libs/libXdmcp
		x11-libs/libXext
		x11-libs/libXi
	)
	xtm? (  app-arch/p7zip 
		linguas_de? ( app-arch/unzip )
		linguas_fr? ( app-arch/unrar ) )
"
DEPEND=""

S=${WORKDIR}

unpackit() {
	unpack "./cd/${1}.tar.gz"
}

src_unpack() {
	cdrom_get_cds .data/bin/Linux/x86/${PN}
	ln -sfn "${CDROM_ROOT}"/.data/data cd
	for i in {x3,datfiles,mov}; do
		unpackit ${i}
	done
	cp -rf "${CDROM_ROOT}"/.data/bin/Linux/x86/* . || die "cp exes"
	cp -f "${CDROM_ROOT}"/READ* . || die "cp READ*"
	if use cockpit && use xtm; then
		ewarn "cockpit-mod is incompatible with xtm."
	elif use cockpit && ! use xtm; then
		unpackit cockpit
	fi

	use bonuspack && unpackit bonuspack
	use modkit && unpackit modkit
	use linguas_fr && unpackit fr_lang
	use linguas_it && unpackit it_lang
	use linguas_de && unpackit de_lang
	for p in 2.5-2.5.01 2.5.01-2.5.02 2.5.02-2.5.03; do
		einfo "Applying patch ${p}"
		mkdir patch
		pushd patch
		unpack_makeself "${PN}-${p}-x86.run"
		bin/Linux/x86/loki_patch patch.dat "${S}" || die "loki_patch ${p}"
		cp -f README.txt "${S}/ChangeLog" || die "cp README.txt"
		popd
		rm -rf patch
	done
	if use xtm; then
		ln -sfn scripts Scripts
		ln -sfn "${DISTDIR}"/XTM_0.7.5_Full.exe ./xtm.7z
		unpack ./xtm.7z
		rm -f xtm.7z
		rm -f Scripts
		pushd t
		use linguas_de && unpack german_TFiles_0.75b.zip 
		use linguas_fr && unpack XTM7.5_French_Finale.rar
		popd
	fi
	rm -f cd
}

src_install() {
	local dir=${GAMES_PREFIX_OPT}/${PN}

	insinto "${dir}"
	doins -r * || die "doins -r"
	keepdir "${dir}"/Database

	exeinto "${dir}"
	doexe x3 || die "doexe x3"

	if use modkit ; then
		exeinto "${dir}"/modkit
		doexe modkit/x3{build,tool} || die "doexe modkit"
		local f
		for f in build tool ; do
			games_make_wrapper "x3${f}" "${dir}/modkit/x3${f}"
		done
	fi

	games_make_wrapper ${PN} "./${PN}${dyn}" "${dir}"
	newicon "${CDROM_ROOT}"/.data/icon.xpm ${PN}.xpm || die "newicon"
	make_desktop_entry ${PN} "X3 - Reunion" ${PN}

	prepgamesdirs
}
