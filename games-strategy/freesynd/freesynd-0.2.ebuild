# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="Remake of the classic Syndicate game by Bullfrog"
HOMEPAGE="http://freesynd.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.zip"

LICENSE="GPL-2"
SLOT="0"
# Should work on amd64
KEYWORDS="~x86"
IUSE=""

RDEPEND="
	x86? (
		media-libs/libpng
		media-libs/libsdl
		media-libs/sdl-mixer )
	amd64? ( app-emulation/emul-linux-x86-sdl )"
DEPEND="${RDEPEND}
	app-arch/unzip"

S=${WORKDIR}/${PN}/src
dir=${GAMES_DATADIR}/${PN}

src_unpack() {
	unpack ${A}
	cd "${S}"

	# Customize directory
	sed -i \
		-e "s:\"./:\"${dir}/:" \
		file.cpp || die "sed file.cpp"

	sed -i \
		-e "s:loadMusicFile(\":loadMusicFile(\"${dir}/:" \
		musicmanager.cpp || die "sed musicmanager.cpp"
}

src_install() {
	dogamesbin ${PN} || die
	newgamesbin dump ${PN}-dump || die
	newgamesbin dumpmaps ${PN}-dumpmaps || die

	insinto "${dir}"
	doins ../*.mp3 || die
	doins -r ../data || die

	dodoc ../*.txt

	make_desktop_entry ${PN} "Free Syndicate"

	prepgamesdirs
}
