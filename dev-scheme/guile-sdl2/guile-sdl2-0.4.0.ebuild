# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Guile Scheme bindings for the SDL2 C shared library"
HOMEPAGE="https://dthompson.us/projects/guile-sdl2.html"
SRC_URI="https://files.dthompson.us/guile-sdl2/${P}.tar.gz"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-scheme/guile
	media-libs/libsdl2
	media-libs/sdl2-image
	media-libs/sdl2-mixer
	media-libs/sdl2-ttf
"
RDEPEND="${DEPEND}"
