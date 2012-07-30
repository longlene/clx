# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit versionator games

MY_PV="$(delete_all_version_separators)"
MY_PF="${PN/-bin}${MY_PV}"
MY_PN="${PN/-bin}"

DESCRIPTION="Tibia is a free fantasy MMORPG."
HOMEPAGE="http://www.tibia.com/"
SRC_URI="http://download.tibia.com/${MY_PF}.tgz"

LICENSE="CipSoft GmbH"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="virtual/opengl"

S=${WORKDIR}/Tibia
src_install() {

dir="${GAMES_PREFIX_OPT}/${MY_PN}"

	exeinto ${dir}
	doexe Tibia Showerror Patch	|| die "doexe failed"
	insinto ${dir}
	doins Tibia.{dat,pic,spr,xpm}	|| die "doins failed"

	games_make_wrapper ${MY_PN} "./Tibia" "${dir}"
	make_desktop_entry ${MY_PN} "Tibia" "${GAMES_PREFIX_OPT}/${MY_PN}"/Tibia.xpm

	prepgamesdirs 
}