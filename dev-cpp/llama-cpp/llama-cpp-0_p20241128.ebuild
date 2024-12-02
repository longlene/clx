# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="678d7994f4da0af3d29046be99950ac999ee9762"

DESCRIPTION="Port of Facebook's LLaMA model in C/C++"
HOMEPAGE="https://github.com/ggerganov/llama.cpp"
SRC_URI="https://github.com/ggerganov/llama.cpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="blas cuda kompute vulkan"

DEPEND="
	net-misc/curl
	blas? ( sci-libs/openblas:= )
	cuda? ( dev-util/nvidia-cuda-toolkit )
	kompute? ( dev-libs/kompute )
	vulkan? ( media-libs/vulkan-loader )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DLLAMA_BUILD_TESTS=OFF
		-DLLAMA_CURL=ON
		-DGGML_BLAS=$(usex blas)
		-DGGML_CUDA=$(usex cuda)
		-DGGML_KOMPUTE=$(usex kompute)
		-DGGML_VULKAN=$(usex vulkan)
	)
	cmake_src_configure
}
