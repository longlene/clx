inherit games

DESCRIPTION="don't take it personally, babe, it just ain't your story - A
spiritual sequel of sorts to Digital: A Love Story, set in a prestigious private
high school, and on the social networks of 2027"
HOMEPAGE="http://scoutshonour.com/donttakeitpersonallybabeitjustaintyourstory/"
SRC_URI="http://scoutshonour.com/donttakeitpersonallybabeitjustaintyourstory/don't%20take%20it%20personally,%20babe-${PV}-linux-x86.tar.bz2"

EAPI="2"

LICENSE="CCPL-Attribution-ShareAlike-NonCommercial-3.0"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-games/renpy:6.12"
RDEPEND="${DEPEND}"

src_install() {
	cd "don't take it personally, babe-${PV}-linux-x86"

	insinto "${GAMES_DATADIR}/${PN}"
	doins -r game/* || die "doins failed" 

	games_make_wrapper ${PN} "renpy-6.12 \"${GAMES_DATADIR}/${PN}\""

	dodoc README.html || die "dodoc failed"

	prepgamesdirs
}
