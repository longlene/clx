# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_PL="tibia"			# Lower-Case package name
MY_PU="Tibia"			# Upper-Case package name
MY_LIBCV="6"			# This is the libc version used (right now it is either (5 or 6)
MY_PV="7.82-${MY_LIBCV}"

inherit games

DESCRIPTION="Tibia is a free fantasy MMORPG."
HOMEPAGE="http://www.tibia.com/home/"
SRC_URI="http://download.tibia.com/${MY_PL}-${MY_PV}.tgz"

LICENSE="CipSoft GmbH"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND=""

dir="${GAMES_PREFIX_OPT}/${MY_PL}-bin"

src_install()
{
	##
	# Prep game files
	insinto ${dir}
	exeinto ${dir}

	doins ${WORKDIR}/${MY_PU}/* || die "doins failed"
	doexe ${WORKDIR}/${MY_PU}/${MY_PU} || "doexe"

	##
	# Manipulating the binary for use
	games_make_wrapper ${MY_PL} "./${MY_PU}" "${dir}"

	doicon ${MY_PU}.xpm || die "Icon generation failed"

	prepgamesdirs 
	make_desktop_entry Tibia "Tibia" ${PN}.xpm
}
