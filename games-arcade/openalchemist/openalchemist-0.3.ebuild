# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="NaturalChimie clone written with clanlib"
HOMEPAGE="http://www.openalchemist.com/"
SRC_URI="mirror://sourceforge/${PN}/${P}-src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-games/clanlib-0.8.0"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

S=${WORKDIR}/${P}-src

pkg_setup() {
	if ! built_with_use dev-games/clanlib opengl sdl ; then
		eerror "${PN} needs opengl and sdl support in dev-games/clanlib"
		die "Please emerge dev-games/clanlib with USE=\"opengl sdl\""
	fi
}

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}-gentoo.patch"
}

src_install() {
	dogamesbin build/${PN} || die "dogamesbin failed"
	dogamesbin ${PN}-config || die "dogamesbin config failed"
	
	insinto "${GAMES_DATADIR}"/${PN}
	doins -r data skins || die "doins failed"
	
	dodoc NEWS README TODO ChangeLog
	
	newicon data/logo.png openalchemist.png
	newicon data/logo_svg.svg openalchemist.svg
	make_desktop_entry ${PN} OpenAlchemist ${PN}

	prepgamesdirs
}
