# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="SIMD Library for Evaluating Elementary Functions"
HOMEPAGE="https://sleef.org/"
SRC_URI="https://github.com/shibatch/sleef/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i "/install/{s#lib#$(get_libdir)#}" src/dft/CMakeLists.txt
	sed -i "/install/{s#lib#$(get_libdir)#}" src/libm/CMakeLists.txt
	cmake-utils_src_configure
}

src_configure() {
	local mycmakeargs=(
	-DBUILD_TESTS=OFF
	)
	cmake-utils_src_configure
}
