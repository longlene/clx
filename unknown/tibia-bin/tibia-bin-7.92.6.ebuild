# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_PU="Tibia"			# Upper-Case package name
MY_LIBCV="6"			# This is the libc version used (right now it is either (5 or 6)
MY_PV="7.92-${MY_LIBCV}"

inherit games

DESCRIPTION="Tibia is a free fantasy MMORPG."
HOMEPAGE="http://www.tibia.com/news/index.php?subtopic=latestnews"
SRC_URI="http://download.tibia.com/tibia-${MY_PV}.tgz"

LICENSE="CipSoft GmbH"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="virtual/opengl"
DEPEND=""

S=${WORKDIR}/${MY_PU}
src_install() {

dir="${GAMES_PREFIX_OPT}/${PN}"

	exeinto ${dir}
	doexe ${MY_PU} showerror	|| die "doexe failed"
	insinto ${dir}
	doins ${MY_PU}.{dat,pic,spr,xpm}	|| die "doins failed"

	prepgamesdirs 

	games_make_wrapper ${PN} "./${MY_PU}" "${dir}"
	make_desktop_entry ${PN} "Tibia" "${GAMES_PREFIX_OPT}/${PN}"/${MY_PU}.xpm
}
