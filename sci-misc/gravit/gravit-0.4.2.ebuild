# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
# likewhoa

inherit games

DESCRIPTION="Gravit is a gravity simulator. It uses Newtonian physics using \
the Barnes-Hut N-body algorithm."
HOMEPAGE="http://gravit.slowchop.com"
SRC_URI="http://${PN}.slowchop.com/dist/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE="lua"

DEPEND="media-libs/sdl-image
		media-libs/sdl-ttf
		media-libs/libsdl
		lua? ( dev-lang/lua )"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
}

src_compile() {
	egamesconf \
	--with-x \
	$(use_enable lua) \
	|| die "econf failed."
}

src_install() {
	make DESTDIR="${D}" install || die "econf failed."
	dodoc {AUTHORS,ChangeLog,README,NEWS}
	prepgamesdirs
}

pkg_postinst() {
	games_pkg_preinst
}
