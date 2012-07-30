# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="Touche: The Adventures of the Fifth Musketeer (interactive demo)"
HOMEPAGE="http://wiki.scummvm.org/index.php/Touch%C3%A9:_The_Adventures_of_the_Fifth_Musketeer"
SRC_URI="http://gentooexperimental.org/~unlord/touche_demo.zip"

LICENSE="freedist"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="strip"

RDEPEND=">=games-engines/scummvm-0.10.0"
DEPEND="app-arch/unzip"

S=${WORKDIR}
dir=${GAMES_DATADIR}/${PN}

src_install() {
	insinto "${dir}"
	doins DATABASE/TOUCHE.DAT \
		OBJ \
		V100 \
		V101 \
		V103 \
		V26 \
		V91 \
		V93 \
		V97 \
		V98 || die "doins failed"

	games_make_wrapper ${PN} "scummvm -f -p \"${dir}\" touche"
	make_desktop_entry ${PN} "Touche: The Adventures of the Fifth Musketeer (Demo)"

	prepgamesdirs
}
