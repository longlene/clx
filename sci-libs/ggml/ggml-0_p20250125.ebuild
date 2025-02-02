# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake flag-o-matic vcs-snapshot

EGIT_COMMIT="32f0b85987396945afea2291d5f4c5862434292b"
KOMPUTE_COMMIT="4565194ed7c32d1d2efa32ceab4d3c6cae006306"

DESCRIPTION="Tensor library for machine learning"
HOMEPAGE="https://github.com/ggerganov/ggml"
SRC_URI="
	https://github.com/ggerganov/ggml/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	kompute? ( https://github.com/nomic-ai/kompute/archive/${KOMPUTE_COMMIT}.tar.gz -> kompute-${KOMPUTE_COMMIT}.tar.gz )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+blas cuda mkl kompute opencl +openmp rocm -sycl vulkan"

DEPEND="
	blas? (
		mkl? ( sci-libs/mkl )
		!mkl? ( sci-libs/openblas:= )
	)
	cuda? ( dev-util/nvidia-cuda-toolkit )
	mkl? ( sci-libs/mkl )
	rocm? ( sci-libs/rocBLAS )
	sycl? ( llvm-core/dpcpp )
	vulkan? ( media-libs/vulkan-loader )
"
RDEPEND="${DEPEND}"
BDEPEND=""
REQUIRED_USE="sycl? ( blas )"

src_prepare() {
	default
	eapply "${FILESDIR}"/system-mkl.patch
	eapply "${FILESDIR}"/system-sycl.patch
	eapply "${FILESDIR}"/ggml-pc-fix.patch
	if use kompute ; then
		rmdir src/ggml-kompute/kompute
		ln -sv "${WORKDIR}"/kompute-${KOMPUTE_COMMIT} src/ggml-kompute/kompute
	fi
	cmake_src_prepare
}

src_configure() {
	if use sycl ; then
		export CC=icx
		export CXX=icpx
		filter-flags '-mabm'
		filter-flags '--param=l1-cache-*'
		filter-flags '--param=l2-cache-*'
	fi
	local blas=OFF
	local blas_vendor="Generic"
	if use blas ; then
		blas=ON
		if use cuda ; then
			blas_vendor="NVHPC"
		elif use mkl ; then
			blas_vendor="Intel"
		fi
	fi
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=ON
		-DGGML_BLAS=${blas}
		-DGGML_BLAS_VENDOR=${blas_vendor}
		-DGGML_CUDA=$(usex cuda)
		-DGGML_HIPBLAS=$(usex rocm)
		-DGGML_VULKAN=$(usex vulkan)
		-DGGML_KOMPUTE=$(usex kompute)
		-DGGML_OPENMP=$(usex openmp)
		-DGGML_SYCL=$(usex sycl)
		-DGGML_OPENCL=$(usex opencl)
		-DGGML_BUILD_TESTS=OFF
		-DGGML_BUILD_EXAMPLES=OFF
		-DGGML_RPC=ON
	)
	cmake_src_configure
}
