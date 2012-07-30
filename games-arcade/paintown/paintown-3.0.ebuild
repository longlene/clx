# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="Side-scrolling beat-em-up in the style of Beats of Rage"
HOMEPAGE="http://paintown.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=">=media-libs/allegro-4.1
	media-libs/aldumb
	media-libs/freetype
	media-libs/libpng"
DEPEND="${RDEPEND}
	dev-util/cmake"

S=${WORKDIR}/build
dir=${GAMES_DATADIR}/${PN}

src_unpack() {
	unpack ${A}
	mkdir "${S}"
	cd "${WORKDIR}/${P}" || die

	# Set default datapath
	sed -i \
		-e "/const char \* DATAPATH_ARG/a\\\tUtil\:\:setDataPath(\"${dir}\");" \
		src/main.cpp || die "sed main.cpp"
}

src_compile() {
	cmake ../${P} || die "cmake"
	emake || die "emake"
}

src_install() {
	dogamesbin bin/${PN} || die

	cd ../${P} || die
	insinto "${dir}"
	doins -r data/* || die

	make_desktop_entry ${PN} Paintown

	dodoc "${WORKDIR}/${P}"/{README,TODO}

	prepgamesdirs
}
