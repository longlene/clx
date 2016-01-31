# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

CMAKE_USE_DIR="${S}"/cmake

inherit cmake-utils

DESCRIPTION="2D game develop library"
HOMEPAGE="http://www.libgosu.org"
SRC_URI="https://github.com/gosu/gosu/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+c++11"

DEPEND="
media-libs/openal
media-libs/libsdl2
media-libs/sdl2-ttf
media-libs/freeimage
media-libs/sdl2-image
media-libs/sdl2-mixer
"
RDEPEND="${DEPEND}"

#PATCHES=( "${FILESDIR}"/${P}.patch )

src_prepare() {
	sed -i "/DESTINATION/ s| lib | $(get_libdir) |" cmake/src.cmake
	enable_cmake-utils_src_prepare
}

src_configure() {
	local mycmakeflags=(
	$(cmake-utils_use c++11 GOSU_CPP11_ENABLED)
	)
	cmake-utils_src_configure
}
