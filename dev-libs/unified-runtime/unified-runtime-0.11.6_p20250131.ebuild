# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

EGIT_COMMIT="af4f3310165bb06f7e5bfceac0a23d9f1e04f911"
COMPUTE_RUNTIME_PV="24.39.31294.12"

DESCRIPTION="Unified Runtime"
HOMEPAGE="https://oneapi-src.github.io/unified-runtime/"
SRC_URI="
	https://github.com/oneapi-src/unified-runtime/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/intel/compute-runtime/archive/${COMPUTE_RUNTIME_PV}.tar.gz -> intel-compute-runtime-${COMPUTE_RUNTIME_PV}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda l0 opencl rocm"

DEPEND="
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
	eapply "${FILESDIR}"/system-umf.patch
	eapply "${FILESDIR}"/system-l0.patch
	rm include/.clang-format
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DUR_BUILD_EXAMPLES=OFF
		-DUR_BUILD_TESTS=OFF
		-DUR_BUILD_TOOLS=ON
		-DUR_BUILD_ADAPTER_L0=$(usex l0)
		-DUR_BUILD_ADAPTER_L0_V2=$(usex l0)
		-DUR_LEVEL_ZERO_LOADER_LIBRARY=/usr/$(get_libdir)/libze_loader.so
		-DUR_LEVEL_ZERO_INCLUDE_DIR=/usr/include/level_zero
		-DUR_COMPUTE_RUNTIME_DIR="${WORKDIR}"/compute-runtime-${COMPUTE_RUNTIME_PV}
		-DUR_BUILD_ADAPTER_OPENCL=$(usex opencl)
		-DUR_BUILD_ADAPTER_CUDA=$(usex cuda)
		-DUR_BUILD_ADAPTER_HIP=$(usex rocm)
		-DUR_BUILD_ADAPTER_NATIVE_CPU=ON
		-DUR_FORMAT_CPP_STYLE=OFF
	)
	use opencl && mycmakeargs+=( -DUR_OPENCL_INCLUDE_DIR="/usr/include" )
	cmake_src_configure
}
