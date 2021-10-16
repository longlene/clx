# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Dynamically typed N-D expression system based on xtensor"
HOMEPAGE="https://github.com/xtensor-stack/zarray"
SRC_URI="https://github.com/xtensor-stack/zarray/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="simd"

DEPEND="
	dev-cpp/xtensor
	dev-cpp/nlohmann_json
	simd? ( dev-cpp/xsimd )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DZARRAY_USE_XSIMD=$(usex simd)
	)
	cmake_src_configure
}
