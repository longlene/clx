# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils games

DESCRIPTION="Rise of the Triad source port for Linux"
HOMEPAGE="http://www.icculus.org/rott/"
SRC_URI="http://www.icculus.org/rott/releases/${P}.tar.gz
	demo? ( http://filesingularity.timedoctor.org/swdata.zip )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc x86"
IUSE="cdinstall demo midi"

UIDEPEND="media-libs/libsdl
	media-libs/sdl-mixer"
RDEPEND="!demo? ( cdinstall? ( games-fps/rott-data ) )
	demo? ( !games-fps/rott-data )
	midi? ( media-libs/sdl-mixer[midi,timidity] )"
DEPEND="${UIDEPEND}	
	demo? ( app-arch/unzip )"

S=${WORKDIR}/${P}/${PN}

src_unpack()
{
	unpack ${A}
	cd "${S}"
	if ! use demo; then
		sed -i \
			-e 's/#define SHAREWARE   1/#define SHAREWARE   0/' \
			-e 's/#define SUPERROTT   0/#define SUPERROTT   1/' \
			develop.h || die "sed failed"
	fi
}

src_prepare()
{
	# Fix typo in source code that hinders loading custom levels
	sed -e '0,/strcat (tempstr,".rtc")/s//strcat (tempstr,".rtl")/' \
		-i rt_main.c
}

src_compile()
{
	emake clean || die "emake clean failed"
	emake EXTRACFLAGS="${CFLAGS} -DDATADIR=\\\"${GAMES_DATADIR}/${PN}/\\\"" \
		|| die "emake failed"
}

src_install()
{
	# root only searches pwd for level packs, so bin must be run from datadir
	exeinto "${GAMES_DATADIR}/${PN}"
	doexe ${PN} || die "dogamesbin failed"
	games_make_wrapper ${PN} "./${PN}" "${GAMES_DATADIR}/${PN}"

	cd ${WORKDIR}/${P}/doc
	dodoc *.txt ../{README,COPYING}
	doman rott.6

	if use demo ; then
		cd "${WORKDIR}"
		insinto "${GAMES_DATADIR}"/${PN}
		doins *.dmo huntbgin.* remote1.rts || die "doins demo data failed"
	fi
	doicon "${WORKDIR}"/${P}/misc/${PN}.xpm
	make_desktop_entry ${PN} "Rise of the Triad" ${PN}

	prepgamesdirs
}

pkg_postinst()
{
	games_pkg_postinst
	if ! use demo && ! use cdinstall; then
		elog "To play the full version, you must manually copy the game data files"
		elog "(wad,rts,dmo,rtc,rtl) to ${GAMES_DATADIR}/${PN}/"
	fi

	if use demo && use cdinstall ; then
		elog "You can't use demo & full versions of rott at same time."
		elog "Installing support for demo; rebuild with USE=-demo for full version."
	fi
}
