# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake toolchain-funcs

DESCRIPTION="Computer Vision and AR framework by Meta, platform-independent C/C++ library"
HOMEPAGE="https://facebookresearch.github.io/ocean/"
SRC_URI="https://github.com/facebookresearch/ocean/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="curl minimal ssl test xml"
RESTRICT="!test? ( test )"

DEPEND="
	dev-cpp/eigen:3
	!minimal? (
		app-arch/xz-utils
		dev-libs/libusb:1
		media-libs/freetype
		media-libs/giflib
		media-libs/libjpeg-turbo
		media-libs/libpng
		media-libs/tiff
		virtual/zlib
		curl? ( net-misc/curl )
		ssl? ( dev-libs/openssl:= )
		xml? ( dev-libs/tinyxml2 )
	)
	test? ( dev-cpp/gtest )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DOCEAN_BUILD_MINIMAL=$(usex minimal)
		-DOCEAN_BUILD_DEMOS=OFF
		-DOCEAN_BUILD_TESTS=$(usex test)
		-DBUILD_SHARED_LIBS=ON
	)

	# The bundled Findlibusb-1.0.cmake uses outdated search paths that miss
	# Gentoo's layout (/usr/include/libusb-1.0/ and lib64/); point it directly.
	if ! use minimal; then
		local _pkg=$(tc-getPKG_CONFIG)
		mycmakeargs+=(
			-DLIBUSB_1_INCLUDE_DIR="$(${_pkg} --variable=includedir libusb-1.0)/libusb-1.0"
			-DLIBUSB_1_LIBRARY="$(${_pkg} --variable=libdir libusb-1.0)/libusb-1.0.so"
		)
	fi

	cmake_src_configure
}
