# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=scikit-build-core
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PN="sglang"
MY_P="${MY_PN}-${PV}"

FLASHMLA_COMMIT="05e26647fe840b8baedae486c2d86d5ce4efeb7c"
FLASHINFER_COMMIT="bc29697ba20b7e6bdb728ded98f04788e16ee021"
SGLATTN_COMMIT="f89bc2306632d1ec5f97b014dded4254f5b4a907"

DESCRIPTION="Kernel Library for SGLang"
HOMEPAGE="
	https://pypi.org/project/sglang-kernel
	https://github.com/sgl-project/sglang/
"
SRC_URI="
	https://github.com/sgl-project/sglang/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.gh.tar.gz
	https://github.com/sgl-project/FlashMLA/archive/${FLASHMLA_COMMIT}.tar.gz -> flashmla-${FLASHMLA_COMMIT}.tar.gz
	https://github.com/flashinfer-ai/flashinfer/archive/${FLASHINFER_COMMIT}.tar.gz -> flashinfer-${FLASHINFER_COMMIT}.tar.gz
	https://github.com/sgl-project/sgl-attn/archive/${SGLATTN_COMMIT}.tar.gz -> sglattn-${SGLATTN_COMMIT}.tar.gz
"

S="${WORKDIR}"/${MY_P}/sgl-kernel

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
"
DEPEND="
	${RDEPEND}
"
BDEPEND="
	dev-libs/cutlass
	dev-util/nvidia-cuda-toolkit
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare

	# Replace vendored cutlass/fmt FetchContent with the system dev-libs/cutlass
	# package (fmt's FetchContent_Populate is dropped outright: its source is
	# fetched but never actually referenced anywhere in the build).
	eapply "${FILESDIR}/0001-use-system-cutlass.patch"

	# Adapt cutlass extensions to cutlass >= 4.5 API:
	#   compute_stage_count_or_override* swapped alignment/carveout_bytes template params
	eapply "${FILESDIR}/0002-adapt-cutlass-extensions-to-cutlass-4.5.patch"

	# triton is only needed to install Python helper scripts; stub it out.
	# CMakeLists.txt also has: install(DIRECTORY repo-triton_SOURCE_DIR/python/triton_kernels/triton_kernels/)
	# Create the expected path so CMake's install step doesn't abort.
	mkdir -p "${WORKDIR}"/triton-stub/python/triton_kernels/triton_kernels

	# flashmla.cmake tries to patch cutlass/arch/config.h inside the FlashMLA
	# source tree, but the bundled cutlass snapshot is incomplete; supply the
	# file from the system dev-libs/cutlass installation.
	local flashmla_arch="${WORKDIR}/FlashMLA-${FLASHMLA_COMMIT}/csrc/cutlass/include/cutlass/arch"
	mkdir -p "${flashmla_arch}"
	cp /usr/include/cutlass/arch/config.h "${flashmla_arch}/" || die
}

python_compile() {
	# CUDA compilation is extremely memory-intensive; cap at 2 parallel jobs.
	# ninja receives flags from two sources and the last -j wins:
	#   cmake passes -j N from CMAKE_BUILD_PARALLEL_LEVEL
	#   Portage appends MAKEFLAGS (from MAKEOPTS in make.conf) as trailing args
	# Both must be overridden here so ninja ends up with a single -j2.
	#MAKEFLAGS="-j2" CMAKE_BUILD_PARALLEL_LEVEL=2 distutils-r1_python_compile
	CMAKE_BUILD_PARALLEL_LEVEL=1 distutils-r1_python_compile
}

python_configure_all() {
	# Match MKL threading layer to however sci-libs/mkl was installed.
	# MKLConfig.cmake defaults to intel_thread, but the installed lib may differ.
	local mkl_threading
	if has_version "sci-libs/mkl[tbb]"; then
		mkl_threading=tbb_thread
	elif has_version "sci-libs/mkl[gnu-openmp]"; then
		mkl_threading=gnu_thread
	else
		mkl_threading=intel_thread
	fi

	DISTUTILS_ARGS=(
		-DFETCHCONTENT_FULLY_DISCONNECTED=ON
		# Default is 32: nvcc spawns 32 threads per .cu file to compile all GPU
		# archs in parallel, causing OOM regardless of ninja's -j setting.
		-DSGL_KERNEL_COMPILE_THREADS=1
		-DMKL_THREADING=${mkl_threading}
		"-DFETCHCONTENT_SOURCE_DIR_REPO-FLASHMLA=${WORKDIR}/FlashMLA-${FLASHMLA_COMMIT}"
		"-DFETCHCONTENT_SOURCE_DIR_REPO-FLASHINFER=${WORKDIR}/flashinfer-${FLASHINFER_COMMIT}"
		"-DFETCHCONTENT_SOURCE_DIR_REPO-FLASH-ATTENTION=${WORKDIR}/sgl-flash-attn-${SGLATTN_COMMIT}"
		"-DFETCHCONTENT_SOURCE_DIR_REPO-TRITON=${WORKDIR}/triton-stub"
	)
}
