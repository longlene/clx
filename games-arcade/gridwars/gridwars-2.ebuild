# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="Your small ship sits in a one-screen grid and vectorized enemies spawn to attack."
HOMEPAGE="http://gridwars.marune.de/"
SRC_URI="http://gridwars.marune.de/bin/${PN}_lin.zip"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="${RDEPEND}
	app-arch/unzip"
RDEPEND="virtual/libstdc++
	 x11-base/xorg-x11"

S=${WORKDIR}
dir=${GAMES_PREFIX_OPT}/${PN}

src_unpack() {
	unpack ${A}
}

src_install() {
	exeinto "${dir}"
	doexe ${PN}
	dosym ${dir}/${PN} ${GAMES_BINDIR}/${PN}
	
	# workaround for creating a writable hiscores.dat
	touch hiscores.dat

	insinto "${dir}"
	doins -r gfx music sounds bass.dll Config.txt hiscores.dat
	fperms 660 ${dir}/Config.txt
	fperms 660 ${dir}/hiscores.dat

	make_desktop_entry ${PN} "Gridwars"
	
	prepgamesdirs
}
