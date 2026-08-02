# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="ggml speech-to-text inference for 16+ model families"
HOMEPAGE="https://github.com/handy-computer/transcribe.cpp"
SRC_URI="https://github.com/handy-computer/transcribe.cpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/transcribe.cpp-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+blas cuda openmp test tools vulkan"
RESTRICT="!test? ( test )"

RDEPEND="
	blas? ( virtual/blas )
	vulkan? ( media-libs/vulkan-loader )
"
DEPEND="${RDEPEND}
	vulkan? ( dev-util/vulkan-headers )
"
BDEPEND="
	cuda? ( dev-util/nvidia-cuda-toolkit )
"

src_configure() {
	local mycmakeargs=(
		-DTRANSCRIBE_BUILD_TESTS=$(usex test)
		-DTRANSCRIBE_BUILD_EXAMPLES=ON
		-DTRANSCRIBE_BUILD_TOOLS=$(usex tools)
		-DTRANSCRIBE_VULKAN=$(usex vulkan)
		-DTRANSCRIBE_CUDA=$(usex cuda)
		-DTRANSCRIBE_USE_OPENMP=$(usex openmp)
		-DTRANSCRIBE_USE_SYSTEM_BLAS=$(usex blas)
		-DTRANSCRIBE_INSTALL=ON
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	dobin "${BUILD_DIR}/bin/transcribe-cli"
}
