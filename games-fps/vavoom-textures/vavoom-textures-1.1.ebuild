# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

# For some package the version hasn't been bumped
OLD_PV="1.0"

DESCRIPTION="Enhanced graphics and textures for Vavoom"
HOMEPAGE="http://www.vavoom-engine.com/"

SRC_URI="doom1? ( mirror://sourceforge/vavoom/vtextures-doom-${PV}.zip
					mirror://sourceforge/vavoom/vtextures-doom1-${PV}.zip )
	doom2? ( mirror://sourceforge/vavoom/vtextures-doom-${PV}.zip
				mirror://sourceforge/vavoom/vtextures-doom2-${PV}.zip )
	heretic? ( mirror://sourceforge/vavoom/vtextures-heretic-${OLD_PV}.zip )
	hexen? ( mirror://sourceforge/vavoom/vtextures-hexen-${OLD_PV}.zip )
	plutonia? ( mirror://sourceforge/vavoom/vtextures-doom-${PV}.zip
				mirror://sourceforge/vavoom/vtextures-doom2-${PV}.zip
				mirror://sourceforge/vavoom/vtextures-plutonia-${OLD_PV}.zip )
	tnt? (	mirror://sourceforge/vavoom/vtextures-doom-${PV}.zip
			mirror://sourceforge/vavoom/vtextures-doom2-${PV}.zip
			mirror://sourceforge/vavoom/vtextures-tnt-${OLD_PV}.zip )
	strife? ( mirror://sourceforge/vavoom/vtextures-strife-${OLD_PV}.zip )
	!doom1? ( !doom2? ( !heretic? ( !hexen? ( !plutonia? ( !tnt? ( !strife? (
		mirror://sourceforge/vavoom/vtextures-doom-${PV}.zip
		mirror://sourceforge/vavoom/vtextures-doom1-${PV}.zip
		mirror://sourceforge/vavoom/vtextures-doom2-${PV}.zip
		mirror://sourceforge/vavoom/vtextures-heretic-${OLD_PV}.zip
		mirror://sourceforge/vavoom/vtextures-hexen-${OLD_PV}.zip
		mirror://sourceforge/vavoom/vtextures-plutonia-${OLD_PV}.zip
		mirror://sourceforge/vavoom/vtextures-tnt-${OLD_PV}.zip
		) ) ) ) ) ) )"

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="doom1 doom2 heretic hexen plutonia strife tnt"

RDEPEND="games-fps/vavoom"
DEPEND="app-arch/unzip"

S=${WORKDIR}

src_unpack() {
	unpack ${A}

	cd "${S}"
	# Rename docs and remove duplicates
	for u in `ls -1 basev` ; do
		case "${u}" in
			"doom")
				cp "basev/${u}/xgfx.txt" "${u}-gfx.txt"
				cp "basev/${u}/xwalls.txt" "${u}-walls.txt"
				cp "basev/${u}/xflats.txt" "${u}-flats.txt"
				;;
			"heretic")
				cp "basev/${u}/xgfx.txt" "${u}-textures.txt"
				;;
			"hexen")
				cp "basev/${u}/xgfx.txt" "${u}-textures.txt"
				;;
			"strife")
				cp "basev/${u}/xgfx.txt" "${u}-gfx.txt"
				cp "basev/${u}/xwalls.txt" "${u}-walls.txt"
				;;
		esac
	done

	# Delete all stale docs
	find basev/ -name "*.txt" -delete
}

src_install() {
	dodoc *.txt || die "dodoc failed"

	cd basev
	insinto "${GAMES_DATADIR}/vavoom/basev/"
	doins -r * || die "doins failed"

	prepgamesdirs
}
