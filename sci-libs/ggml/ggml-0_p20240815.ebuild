# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="9ad0906ffca1758f29270f59938d78740808ba93"

DESCRIPTION="Tensor library for machine learning"
HOMEPAGE="https://github.com/ggerganov/ggml"
SRC_URI="https://github.com/ggerganov/ggml/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="blas cuda vulkan"

DEPEND="
	blas? ( sci-libs/openblas )
	cuda? ( dev-util/nvidia-cuda-toolkit )
	vulkan? ( media-libs/vulkan-loader )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DGGML_BUILD_TESTS=OFF
		-DGGML_BUILD_EXAMPLES=OFF
		-DGGML_BLAS=$(usex blas)
		-DGGML_CUDA=$(usex cuda)
		-DGGML_CURL=ON
		-DGGML_VULKAN=$(usex vulkan)
		-DGGML_CCACHE=OFF
	)
	cmake_src_configure
}
