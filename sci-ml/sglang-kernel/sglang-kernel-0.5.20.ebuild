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

# The sgl_kernel/sglang-kernel component carries its OWN version
# (python/sglang/kernels/aot/pyproject.toml: "0.4.7" as of this bump),
# fully decoupled from the surrounding sglang monorepo tag we fetch it from
# — ${PV} here tracks that monorepo tag (v${PV}), not sgl-kernel's own
# version, to keep a stable/sortable upgrade path in this overlay.
#
# Formerly at sgl-kernel/ (through sglang v0.5.16); moved to
# python/sglang/kernels/aot/ upstream (still builds the same "sgl_kernel"
# install target — commit c32c4ef "Move sgl-kernel under sglang.kernels.aot").
FLASHMLA_COMMIT="3e18517fb055a6c9608eef5a1f1347fb1a047bbd"
FLASHINFER_COMMIT="bc29697ba20b7e6bdb728ded98f04788e16ee021"
SGLATTN_COMMIT="f89bc2306632d1ec5f97b014dded4254f5b4a907"
# FlashMLA's csrc/cutlass submodule pin (its sm100 kernels use a cutlass
# SM100-MMA API that the newer system dev-libs/cutlass no longer provides,
# so it must build against this exact commit, not the system cutlass).
FLASHMLA_CUTLASS_COMMIT="147f5673d0c1c3dcf66f78d677fd647e4a020219"
# flashmla.cmake also pins its own separate (older) cutlass commit for its
# csrc/cutlass submodule; 0003-flashmla-use-system-cutlass.patch points that
# at system dev-libs/cutlass instead, same as the main cutlass integration.

DESCRIPTION="Kernel Library for SGLang"
HOMEPAGE="
	https://pypi.org/project/sglang-kernel
	https://github.com/sgl-project/sglang/
"
SRC_URI="
	https://github.com/sgl-project/sglang/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.gh.tar.gz
	https://github.com/sgl-project/FlashMLA/archive/${FLASHMLA_COMMIT}.tar.gz -> flashmla-${FLASHMLA_COMMIT}.tar.gz
	https://github.com/NVIDIA/cutlass/archive/${FLASHMLA_CUTLASS_COMMIT}.tar.gz
		-> cutlass-${FLASHMLA_CUTLASS_COMMIT}.tar.gz
	https://github.com/flashinfer-ai/flashinfer/archive/${FLASHINFER_COMMIT}.tar.gz
		-> flashinfer-${FLASHINFER_COMMIT}.tar.gz
	https://github.com/sgl-project/sgl-attn/archive/${SGLATTN_COMMIT}.tar.gz -> sglattn-${SGLATTN_COMMIT}.tar.gz
"

S="${WORKDIR}"/${MY_P}/python/sglang/kernels/aot

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
"
DEPEND="
	${RDEPEND}
"
BDEPEND="
	>=dev-libs/cutlass-4.5.2
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

	# flashmla.cmake's csrc/cutlass submodule pin: the new FlashMLA
	# sm100 kernels need this exact (older) cutlass commit — the newer
	# system dev-libs/cutlass changed the SM100-MMA API and the
	# FlashMLA code no longer compiles against it. Vendored via SRC_URI;
	# extract it over the (empty) submodule dir. The in-cmake SM103
	# config.h patch then runs against this local writable copy.
	eapply "${FILESDIR}/0003-flashmla-vendored-cutlass.patch"
	local fmla="${WORKDIR}"/FlashMLA-${FLASHMLA_COMMIT}
	rm -rf "${fmla}"/csrc/cutlass
	tar -xzf "${DISTDIR}"/cutlass-${FLASHMLA_CUTLASS_COMMIT}.tar.gz -C "${fmla}"/csrc
	mv "${fmla}"/csrc/cutlass-${FLASHMLA_CUTLASS_COMMIT} "${fmla}"/csrc/cutlass

	# The dead old-style to_tiled_mma_sm100_ts overload in the fetched
	# sgl-flash-attn submodule no longer parses against cutlass >= 4.7
	# (SM100_MMA_F8F6F4_SS became a template); make its signature
	# version-conditional.
	eapply --directory "${WORKDIR}"/sgl-flash-attn-${SGLATTN_COMMIT} -- \
		"${FILESDIR}/0004-sglattn-cutlass-4.7-compat.patch"

	# triton is only needed to install Python helper scripts; stub it out.
	# CMakeLists.txt also has: install(DIRECTORY repo-triton_SOURCE_DIR/python/triton_kernels/triton_kernels/)
	# Create the expected path so CMake's install step doesn't abort.
	mkdir -p "${WORKDIR}"/triton-stub/python/triton_kernels/triton_kernels
}

python_compile() {
	# CUDA compilation is extremely memory-intensive; cap at 2 parallel jobs.
	# ninja receives flags from two sources and the last -j wins:
	#   cmake passes -j N from CMAKE_BUILD_PARALLEL_LEVEL
	#   Portage appends MAKEFLAGS (from MAKEOPTS in make.conf) as trailing args
	# Both must be overridden here so ninja ends up with a single -j2.
	#MAKEFLAGS="-j2" CMAKE_BUILD_PARALLEL_LEVEL=2 distutils-r1_python_compile
	# The full 8-arch build tree plus GB-sized ptxas temp files for the
	# sm90/sm100 instantiations exceed the 25G /var/tmp/portage tmpfs on
	# this system; spill compiler temp files onto the root filesystem.
	local -x TMPDIR=/var/tmp/${PN}-tmp
	mkdir -p "${TMPDIR}"
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
		# Torch 2.13+ headers require C++20 (torch/all.h #errors on < C++20);
		# upstream's SGL_KERNEL_CXX_STANDARD defaults to 17 — override it.
		-DSGL_KERNEL_CXX_STANDARD=20
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
