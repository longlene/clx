# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

DESCRIPTION="I Have No Mouth, and I Must Scream (interactive demo)"
HOMEPAGE="http://harlanellison.com/herc.htm#ihnm"
SRC_URI="http://gentooexperimental.org/~unlord/scream.rar"

LICENSE="freedist"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="strip"

RDEPEND=">=games-engines/scummvm-0.11.0"
DEPEND="|| (
	app-arch/unrar
	app-arch/rar )"

S=${WORKDIR}
dir=${GAMES_DATADIR}/${PN}

src_install() {
	insinto "${dir}"
	doins MUSIC.RES SCREAM.RES SCRIPTS.RES SFX.RES VOICESD.RES || die "doins failed"

	games_make_wrapper ${PN} "scummvm -f -p \"${dir}\" ihnm-demo"
	#doicon "${FILESDIR}/${PN}.png" || die "doicon failed"
	make_desktop_entry ${PN} "I Have No Mouth, and I Must Scream (Demo)" #${PN}.png

	prepgamesdirs
}
