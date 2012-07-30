# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Engine for japanese Visual Novels."
HOMEPAGE="http://ogapee.at.infoseek.co.jp/onscripter.html"
SRC_URI="http://ogapee.at.infoseek.co.jp/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=" >=app-arch/bzip2-1.0.2 
      >=media-libs/jpeg-6b
      >=media-libs/libsdl-1.2.6 
      >=media-libs/sdl-image-1.2.3 
      >=media-libs/sdl-mixer-1.2.5 
      >=media-libs/sdl-ttf-2.0.6 
      >=media-libs/smpeg-0.4.4 
     media-video/avifile"
RDEPEND="  >=media-libs/jpeg-6b
      >=media-libs/libsdl-1.2.6 
      >=media-libs/sdl-image-1.2.3
      >=media-libs/sdl-mixer-1.2.5 
      >=media-libs/sdl-ttf-2.0.6 
      >=media-libs/smpeg-0.4.4 
     media-video/avifile"

src_compile() {
    emake -f Makefile.Linux || die "emake failed"
}

src_install() {
    dobin onscripter

    dodoc README
    dohtml www/onscripter.html
}
