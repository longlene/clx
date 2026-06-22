# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A blazing-fast, lightweight deep learning inference engine"
HOMEPAGE="https://github.com/alibaba/MNN http://www.mnn.zone/"
SRC_URI="https://github.com/alibaba/MNN/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/MNN-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda opencl opengl openmp test vulkan"
RESTRICT="!test? ( test )"

DEPEND="
	vulkan? (
		dev-util/vulkan-headers
		media-libs/vulkan-loader
	)
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
	opengl? (
		virtual/opengl
		media-libs/glew
	)
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply "${FILESDIR}"/${P}-cuda13-drop-sm60.patch
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DMNN_BUILD_SHARED_LIBS=ON
		-DMNN_BUILD_TRAIN=OFF
		-DMNN_BUILD_DEMO=OFF
		-DMNN_BUILD_TOOLS=OFF
		-DMNN_BUILD_CONVERTER=OFF
		-DMNN_BUILD_BENCHMARK=OFF
		-DMNN_BUILD_LLM=OFF
		-DMNN_BUILD_TEST=$(usex test)
		-DMNN_OPENCL=$(usex opencl)
		-DMNN_OPENGL=$(usex opengl)
		-DMNN_OPENMP=$(usex openmp)
		-DMNN_VULKAN=$(usex vulkan)
		-DMNN_CUDA=$(usex cuda)
	)
	cmake_src_configure
}
