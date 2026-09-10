# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )

inherit cmake python-any-r1

DESCRIPTION="Community vLLM-alike engine in C++ (continuous batching, paged KV)"
HOMEPAGE="https://github.com/mudler/vllm.cpp"
SRC_URI="https://github.com/mudler/vllm.cpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/vllm.cpp-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+cuda test"
RESTRICT="!test? ( test )"

DEPEND="
	cuda? ( dev-libs/cutlass:= )
"
RDEPEND="${DEPEND}"
BDEPEND="
	cuda? ( dev-util/nvidia-cuda-toolkit )
	test? ( ${PYTHON_DEPS} )
"

src_configure() {
	# Point CUTLASS at the system headers via a tiny symlink shim rather than
	# -DVLLM_CPP_CUTLASS_DIR=/usr directly: the latter makes CMake add a
	# whole-tree `-isystem /usr/include` for CUDA translation units, which
	# collides with CUDAToolkit's own `-isystem` entry and breaks nvcc's
	# #include_next chain for <cmath> (fatal error: math.h: No such file or
	# directory) under this GCC 14 + CUDA 13 pairing. The shim keeps the
	# isystem path small and CUDA-toolkit-free.
	if use cuda; then
		mkdir -p "${T}"/cutlass-shim/include || die
		ln -sfn /usr/include/cutlass "${T}"/cutlass-shim/include/cutlass || die
	fi

	local mycmakeargs=(
		-DVLLM_CPP_BUILD_EXAMPLES=ON
		-DVLLM_CPP_SERVER=ON
		-DVLLM_CPP_BUILD_TESTS=$(usex test)
		-DVLLM_CPP_CUDA=$(usex cuda ON OFF)
		-DVLLM_CPP_CUDA_ARCHITECTURES=89
		-DVLLM_CPP_CUTLASS_DIR="${T}/cutlass-shim"
		-DVLLM_CPP_VULKAN=OFF
		-DVLLM_CPP_TENSTORRENT=OFF
		-DVLLM_CPP_HIP=OFF
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	dobin "${BUILD_DIR}/examples/vllm-cli"
}
