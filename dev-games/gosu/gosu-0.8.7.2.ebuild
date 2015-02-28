# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

CMAKE_USE_DIR="${S}"/cmake

inherit cmake-utils

DESCRIPTION="2D game develop library"
HOMEPAGE="http://www.libgosu.org"
SRC_URI="https://github.com/jlnr/gosu/archives/v${PV}.tar.gz -> ${P}.tar.gz"

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
"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}"/${P}.patch )
