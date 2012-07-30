# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-fps/rott/rott-1.0.ebuild,v 1.10 2007/07/22 13:10:49 nyhm Exp $

inherit eutils games

DESCRIPTION="Rise of the Triad for Linux!"
HOMEPAGE="http://www.icculus.org/rott/"
SRC_URI="http://www.icculus.org/rott/releases/${P}.tar.gz
	demo? ( http://filesingularity.timedoctor.org/swdata.zip )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~ppc x86"
IUSE="demo cdinstall"

UIDEPEND="media-libs/libsdl
	media-libs/sdl-mixer"
RDEPEND="!demo? ( cdinstall? ( games-fps/rott-data ) )
	demo? ( ! games-fps/rott-data )"
DEPEND="${UIDEPEND}	
	demo? ( app-arch/unzip )"

S=${WORKDIR}/${P}/rott


src_unpack()
{
	unpack ${A}
	cd "${S}"
	use demo || sed -i \
		-e 's/#define SHAREWARE   1/#define SHAREWARE   0/' \
		-e 's/#define SUPERROTT   0/#define SUPERROTT   1/' \
		develop.h || die "sed failed"
}

src_compile()
{
	emake clean || die
	emake -j1 \
		EXTRACFLAGS="${CFLAGS} -DDATADIR=\\\"${GAMES_DATADIR}/${PN}/\\\"" \
		|| die "emake failed"
}

src_install()
{
	dogamesbin rott || die "dogamesbin failed"

	cd ${WORKDIR}/${P}/doc
	dodoc *.txt ../{README,COPYING}
	doman rott.6

	if use demo ; then
		cd "${WORKDIR}"
		insinto "${GAMES_DATADIR}"/${PN}
		doins *.dmo huntbgin.* remote1.rts || die "doins failed"
	fi
	doicon "${WORKDIR}"/${P}/misc/rott.xpm
	make_desktop_entry rott "RotT" rott

	prepgamesdirs
}

pkg_postinst()
{
	games_pkg_postinst
	if ! use demo && ! use cdinstall; then
		elog "To play the full version, you must copy the"
		elog "data files to ${GAMES_DATADIR}/${PN}/"
	fi

	if use demo && use cdinstall ; then
		elog "You can't use demo & full versions of rott at same time"
		elog "default is demoversion"
	fi
}
