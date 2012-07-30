inherit games

DESCRIPTION="Digital: A love story - A computer mystery/romance set five minutes into the future of 1988"
HOMEPAGE="http://scoutshonour.com/digital/"
SRC_URI="http://digital.artfulgamer.com/${P}.tar.bz2"

EAPI="2"

LICENSE="CCPL-Attribution-ShareAlike-NonCommercial-3.0"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-games/renpy:6.10
	media-video/ffmpeg"
RDEPEND="${DEPEND}"

src_install() {
	cd Digital-linux-x86

	insinto "${GAMES_DATADIR}/${PN}"
	doins -r game/* || die "doins failed" 

	games_make_wrapper ${PN} "renpy-6.10 \"${GAMES_DATADIR}/${PN}\""

	dodoc README.html || die "dodoc failed"

	prepgamesdirs
}
