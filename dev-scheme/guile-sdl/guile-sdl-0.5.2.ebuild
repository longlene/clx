# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

DESCRIPTION="A guile binding for SDL"
HOMEPAGE="https://www.gnu.org/software/guile-sdl"
SRC_URI="mirror://gnu/guile-sdl/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="dev-scheme/guile"
RDEPEND="${DEPEND}
	media-libs/sdl-image
	media-libs/libsdl
	media-libs/sdl-mixer
	media-libs/sdl-gfx
	media-libs/sdl-ttf
"

src_compile() {
	emake -j1
}
