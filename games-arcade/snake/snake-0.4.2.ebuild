# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games eutils

DESCRIPTION="snake like game"
HOMEPAGE="http://www.hs.no-ip.info/software/snake.html"
RESTRICT="mirror"
SRC_URI="http://www.hs.no-ip.info/software/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND="media-libs/libsdl
		media-libs/sdl-gfx
		media-libs/sdl-image
		media-libs/sdl-mixer
		media-libs/sdl-ttf"


src_unpack() {
    unpack ${A}
    cd "${S}"
}

src_compile() {
    emake || die "emake failed"
}

src_install() {
    emake DESTDIR="${D}" install || die "install failed"
}

