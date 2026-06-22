# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="LLM inference with 7x longer context, lossless KV cache compression"
HOMEPAGE="https://github.com/quantumaikr/quant.cpp"
SRC_URI="https://github.com/quantumaikr/quant.cpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/quant.cpp-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda vulkan"
RESTRICT="test"

DEPEND="
	vulkan? (
		dev-util/vulkan-headers
		media-libs/vulkan-loader
	)
"
RDEPEND="
	vulkan? ( media-libs/vulkan-loader )
"
BDEPEND="
	cuda? ( dev-util/nvidia-cuda-toolkit )
"

src_configure() {
	local mycmakeargs=(
		-DTQ_BUILD_TESTS=OFF
		-DTQ_BUILD_BENCH=OFF
		-DTQ_BUILD_EXAMPLES=OFF
		-DTQ_BUILD_CUDA=$(usex cuda)
		-DTQ_BUILD_VULKAN=$(usex vulkan)
		-DTQ_BUILD_SERVER=OFF
		-DTQ_BUILD_ROCM=OFF
		-DTQ_BUILD_METAL=OFF
	)
	use cuda && mycmakeargs+=( -DCMAKE_CUDA_ARCHITECTURES=all-major )
	cmake_src_configure
}

src_install() {
	dolib.so "${BUILD_DIR}/libturboquant.so"
	newlib.a "${BUILD_DIR}/libturboquant.a" libturboquant.a

	insinto /usr/include
	doins -r include/turboquant
	doins quant.h

	dobin "${BUILD_DIR}/quant"
	dobin "${BUILD_DIR}/debug_compare"
	dobin "${BUILD_DIR}/tq_convert"
}
