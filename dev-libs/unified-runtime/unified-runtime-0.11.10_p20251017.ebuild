# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

EGIT_COMMIT="460ab7bc648fa2b3be8e0b7b4f0fd237db5fb606"

DESCRIPTION="Unified Runtime"
HOMEPAGE="https://oneapi-src.github.io/unified-runtime/"
SRC_URI="
	https://github.com/oneapi-src/unified-runtime/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
#KEYWORDS="~amd64"
IUSE="cuda l0 opencl rocm"

DEPEND="
	dev-libs/intel-compute-runtime
	dev-libs/unified-memory-framework
	cuda? ( dev-util/nvidia-cuda-toolkit )
	l0? ( dev-libs/level-zero:= )
	opencl? ( virtual/opencl )
	rocm? ( dev-util/rocm-smi:= )
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

src_prepare() {
	default
	eapply "${FILESDIR}"/system-opencl.patch
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DUR_BUILD_EXAMPLES=OFF
		-DUR_BUILD_TESTS=OFF
		-DUR_BUILD_TOOLS=ON
		-DUR_BUILD_ADAPTER_L0=$(usex l0)
		-DUR_BUILD_ADAPTER_L0_V2=$(usex l0)
		#-DUR_LEVEL_ZERO_LOADER_LIBRARY=/usr/$(get_libdir)/libze_loader.so
		#-DUR_LEVEL_ZERO_INCLUDE_DIR=/usr/include/level_zero
		#-DUR_COMPUTE_RUNTIME_FETCH_REPO=OFF
		#-DUR_COMPUTE_RUNTIME_DIR="/usr/include"
		-DUR_BUILD_ADAPTER_OPENCL=$(usex opencl)
		-DUR_BUILD_ADAPTER_CUDA=$(usex cuda)
		-DUR_BUILD_ADAPTER_HIP=$(usex rocm)
		-DUR_BUILD_ADAPTER_NATIVE_CPU=ON
		-DUR_FORMAT_CPP_STYLE=OFF
		-DUR_USE_EXTERNAL_UMF=ON
	)
	cmake_src_configure
}
