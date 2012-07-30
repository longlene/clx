# Distributed under the terms of the GNU General Public License v2

EAPI=2
inherit eutils games

MY_PN=steelstorm
DESCRIPTION="Steel Storm Episode I game data"
HOMEPAGE="http://www.steel-storm.com/"
RESTRICT="mirror"
SRC_URI="http://download2.steel-storm.com/${MY_PN}-ep1-v${PV}.tar.gz"

LICENSE="CCPL-Attribution-ShareAlike-NonCommercial-3.0"

SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${MY_PN}"

src_install() {
    insinto ${GAMES_DATADIR}/${MY_PN}
    doins -r ${S}/gamedata || die "doins gamedata failed"
}
