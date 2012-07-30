# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit games

MY_PATCHVER="1.0.0.4"

DESCRIPTION="Hexen 2 game data files"
HOMEPAGE="http://www.ravensoft.com/gamesdetail.aspx?xmmid=624&xmid=13&xmview=2"
SRC_URI="uhexen2? ( mirror://sourceforge/uhexen2/h2patch3-${MY_PATCHVER}.tgz )"

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64 ~x86 ~ppc"
IUSE="+uhexen2"

DEPEND="dev-util/xdelta:3"
RDEPEND=""

src_unpack() {
	cdrom_get_cds Install/Hexen2/data1/pak0.pak:INSTALL/HEXEN2/data1/pak0.pak
	case ${CDROM_SET} in
		0) PAKDIR=Install/Hexen2/data1 ;;
		1) PAKDIR=INSTALL/HEXEN2/data1 ;;
		*) die "unrecognized CD" ;;
	esac

	einfo "Copying files from CD..."
	cp "${CD_ROOT}"/"${PAKDIR}"/pak0.pak . \
		|| die "copy pak0.pak failed"
	cp "${CD_ROOT}"/"${PAKDIR}"/pak1.pak . \
		|| die "copy pak1.pak failed"

	if use uhexen2; then
		unpack "${A}"
	fi
}

src_prepare() {
	if use uhexen2; then
		einfo "Patching files for uhexen2..."
		mv pak0.pak pak0.pak.103
		mv pak1.pak pak1.pak.103
		xdelta3  -d -s pak0.pak.103 \
			h2patch3/patchdat/data1/data1pk0.xd3 pak0.pak \
			|| die "patching pak0.pak failed"
		xdelta3  -d -s pak1.pak.103 \
			h2patch3/patchdat/data1/data1pk1.xd3 pak1.pak \
			|| die "patching pak1.pak failed"
	fi
}

src_install() {
	insinto "${GAMES_DATADIR}"/hexen2/data1
	doins pak0.pak || die "doins pak0.pak failed"
	doins pak1.pak || die "doins pak1.pak failed"
	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst
	elog "This is just the data portion of the game.  You also need to install"
	elog "a game engine, such as games-fps/uhexen2, to play the game."
}
