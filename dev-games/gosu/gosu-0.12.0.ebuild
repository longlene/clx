# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="2D game develop library"
HOMEPAGE="http://www.libgosu.org"
SRC_URI="https://github.com/gosu/gosu/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	media-libs/openal
	media-libs/libsdl2
	media-libs/sdl2-ttf
	media-libs/freeimage
	media-libs/sdl2-image
	media-libs/sdl2-mixer
	media-sound/mpg123
"
RDEPEND="${DEPEND}"

CMAKE_USE_DIR="${S}"/cmake

