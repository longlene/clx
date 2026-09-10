# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="ONNX Model Parser for TensorRT"
HOMEPAGE="https://github.com/onnx/onnx-tensorrt"
SRC_URI="https://github.com/onnx/onnx-tensorrt/archive/refs/tags/release/${PV}-GA.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}"/${PN}-release-${PV}-GA

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}"/system-onnx.patch
)

src_prepare() {
	# System abseil-cpp requires std::partial_ordering (C++20); bump from 17
	sed -i 's/set(CMAKE_CXX_STANDARD 17)/set(CMAKE_CXX_STANDARD 20)/' \
		CMakeLists.txt || die
	# Hardcoded "lib" install destination ignores CMAKE_INSTALL_LIBDIR
	sed -i "s|DESTINATION lib$|DESTINATION $(get_libdir)|g" \
		CMakeLists.txt || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCUDA_TOOLKIT_ROOT_DIR="/opt/cuda"
		-DONNX_NAMESPACE=onnx
		-DONNX_USE_LITE_PROTO=ON
	)
	cmake_src_configure
}
