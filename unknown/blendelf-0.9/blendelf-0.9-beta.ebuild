# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Blendelf game engine for blender"
HOMEPAGE="http://blendelf.com"
SRC_URI="http://blendelf.com/downloads/${P}.zip"

LICENSE="zlib"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="${RDEPEND}
    media-libs/glfw
    media-libs/glew
    media-libs/freeimage
    media-libs/freetype
    media-libs/openal
    media-libs/libvorbis
    dev-lang/lua
    sci-physics/bullet"

src_compile() {
    econf --with-posix-regex
    emake || die
}

src_install() {
    emake DESTDIR="${D}" install || die

    dodoc README || die
} 
