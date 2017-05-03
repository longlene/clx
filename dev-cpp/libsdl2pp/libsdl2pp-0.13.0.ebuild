# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

DESCRIPTION="C++11 bindings/wrapper for SDL2"
HOMEPAGE="http://sdl2pp.amdmi3.ru"
SRC_URI="https://github.com/libSDL2pp/libSDL2pp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	media-libs/libsdl2
	media-libs/sdl2-image
	media-libs/sdl2-ttf
	media-libs/sdl2-mixer
"
RDEPEND="${DEPEND}"
