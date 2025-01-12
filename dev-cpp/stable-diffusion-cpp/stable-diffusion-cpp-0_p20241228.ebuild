# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

EGIT_COMMIT="dcf91f9e0f2cbf9da472ee2a556751ed4bab2d2a"
GGML_COMMIT="6fcbd60bc72ac3f7ad43f78c87e535f2e6206f58"

DESCRIPTION="Stable Diffusion and Flux in pure C/C++"
HOMEPAGE="https://github.com/leejet/stable-diffusion.cpp"
SRC_URI="
	https://github.com/leejet/stable-diffusion.cpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/ggerganov/ggml/archive/${GGML_COMMIT}.tar.gz -> ggml-${GGML_COMMIT}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda rocm vulkan"

DEPEND="
	cuda? ( dev-util/nvidia-cuda-toolkit )
	rocm? ( dev-util/rocm-smi )
	vulkan? ( media-libs/vulkan-loader )
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/stable-diffusion.cpp-${EGIT_COMMIT}

src_prepare() {
	default
	rmdir ggml && ln -sv "${WORKDIR}"/ggml-${GGML_COMMIT} ggml
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DSD_CUDA=$(usex cuda)
		-DSD_HIPBLAS=$(usex rocm)
		-DSD_VULKAN=$(usex vulkan)
	)
	cmake_src_configure
}

src_install() {
	dobin "${BUILD_DIR}"/bin/sd
	einstalldocs
}
