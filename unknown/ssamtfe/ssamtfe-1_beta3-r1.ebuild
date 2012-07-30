# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

EAPI="2"

SZ="ftp://ftp.planetmirror.com/pub/seriouszone"
SH_FILE="ssam-tfe-lnx-beta1a.run"

DESCRIPTION="Serious Sam: The First Encounter"
HOMEPAGE="http://icculus.org/betas/ssam/
	http://www.croteam.com/
	http://www.seriouszone.com/"
SRC_URI="${SZ}/${SH_FILE}
	http://icculus.org/betas/ssam/${SH_FILE}
	${SZ}/ssamtfe-beta1b.sh.bin
	http://icculus.org/updates/ssam/ssamtfe-beta1b.sh.bin
	${SZ}/ssamtfe-beta2.sh.bin
	http://icculus.org/updates/ssam/ssamtfe-beta2.sh.bin
	${SZ}/ssamtfe-beta3.sh.bin
	http://icculus.org/updates/ssam/ssamtfe-beta3.sh.bin"

LICENSE="LOKI-EULA"
SLOT="0"
KEYWORDS="amd64 ~x86"
RESTRICT="mirror strip"
IUSE=""

RDEPEND="virtual/opengl
	media-libs/libsdl"
DEPEND="app-arch/unzip
	games-util/loki_patch"

S=${WORKDIR}
dir=${GAMES_PREFIX_OPT}/${PN}
cd_dir="Install"

pkg_setup() {
	games_pkg_setup

	cdrom_get_cds "${cd_dir}"/
}

src_unpack() {
	mkdir Mods Levels
	unpack_makeself "${SH_FILE}" || die "unpack_makeself failed"

	echo "Copying from ${CDROM_ROOT}"
	cp -r "${CDROM_ROOT}/${cd_dir}"/* . || die "doins CD failed"
	# data{1,2}.cab on the CD do not contain game data - can ignore them.
	rm *.cab *.hdr

	unpack ./SeriousSamPatch105_USA_linux.tar.bz2
	unpack ./setupstuff.tar.gz
	unpack ./bins.tar.bz2
	mv bin/${PN} .

	# Apply the Icculus patches
	local v
	for v in 1b 2 3 ; do
		echo "Unpacking version ${v}"
		unpack_makeself "ssamtfe-beta${v}.sh.bin"
		loki_patch patch.dat . || die "loki patch ${v} failed"
		rm patch.dat
	done
}

src_prepare() {
	# Switch to dynamic executable - runs at sane speeds on modern hardware
	einfo $PWD
	sed -i -e 's;exec "./ssam_lnx";exec "./ssam_lnx.dynamic";' ${PN} \
		|| die "dynamic binary update failed"
}

src_install() {
	rm *.{bz2,gz,sh} layout.bin ikernel.ex_
	rm -r CVS data
	rm -r setup* Setup*

	cp -r bin/* Bin/ && rm -r bin/

	exeinto "${dir}"
	doexe ${PN} || die
	rm ${PN}
	exeinto "${dir}"/Bin
	doexe Bin/ssam_lnx* || die
	rm Bin/ssam_lnx*

	newicon ssam.xpm ${PN}.xpm && rm ssam.xpm || die
	games_make_wrapper ${PN} ./${PN} "${dir}" "${dir}"
	make_desktop_entry ${PN} "Serious Sam - First Encounter" ${PN}.xpm

	insinto "${dir}"
	#doins -r * || die "doins main failed"
	cp -rp * "${D}/${dir}" || die "cp main failed"

	# Ensure that file datestamps from the CD are sane
	find "${D}/${dir}" -exec touch '{}' \;

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	einfo "The warning regarding 'XiG-SUNDRY-NONSTANDARD missing' is harmless"
	echo
}
