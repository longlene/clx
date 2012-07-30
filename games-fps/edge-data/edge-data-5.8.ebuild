# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

MY_PN="edge"

DESCRIPTION="Data files for EDGE"
HOMEPAGE="http://edge.sourceforge.net/"
SRC_URI="mirror://sourceforge/${MY_PN}/${MY_PN}-wad-${PV}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="games-fps/edge"

DEPEND="${RDEPEND}
	app-arch/unzip"

S="${WORKDIR}"

src_install() {
	local dir="${GAMES_DATADIR}/${MY_PN}"
	insinto "${dir}"
	doins "${MY_PN}.wad" || die "doins failed"

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	if ! has_version games-fps/edge ; then
		ewarn "This is just data files for EDGE."
		ewarn
		ewarn "To play, emerge the client, like this:"
		ewarn
		ewarn "# emerge edge"
	fi
}
