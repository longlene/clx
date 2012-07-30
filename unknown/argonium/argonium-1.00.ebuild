# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

DESCRIPTION="Multiplayer FPS powered by iD Software's Quake 2 engine"
HOMEPAGE="http://www.planetquake.com/td/argonium/"

I_SRC="http://icculus.org/~ravage/${PN}"
SRC_URI="${I_SRC}/${P}-i386.tar.gz
	${I_SRC}/${PN}_${PV}_src.tar.gz"

LICENSE="GPL-2"
SLOT="0"

# Might work on other arches
KEYWORDS="~x86"

IUSE="debug"

DEPEND="media-libs/alsa-lib
	sys-libs/glibc
	virtual/opengl"

S=${WORKDIR}/${PN}_src/linux
dir=${GAMES_DATADIR}/${PN}

src_compile() {
	local myconf

	# Keep the directory names simple
	sed -i Makefile \
		-e 's/debug$(ARCH)/build/' \
		-e 's/release$(ARCH)/build/' \
		|| die "sed failed"

	if use debug ; then
		myconf="build_debug"
	else
		myconf="build_release"
	fi

	emake ${myconf}
}

src_install() {

	exeinto "${dir}"
	doexe build/{argonium,refresh.so}
	exeinto "${dir}"/data
	doexe build/runtime*.so

	# Data files
	insinto "${dir}"
	cd "${WORKDIR}"/${PN}
	rm argonium *.so data/*.so
	dodoc README.Linux *.txt && rm README.Linux *.txt

	doins -r * || die "doins data failed"

	games_make_wrapper ${PN} ./${PN} "${dir}" "${dir}"
	make_desktop_entry ${PN} Argonium

	prepgamesdirs
}
