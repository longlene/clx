# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake flag-o-matic vcs-snapshot

EGIT_COMMIT="6a7a034e117f189df4d13665b9b604638ddca468"
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
#IUSE="cuda mkl kompute opencl +openmp rocm sycl vulkan"
IUSE="cuda mkl kompute +openmp rocm vulkan"

DEPEND="
	cuda? ( dev-util/nvidia-cuda-toolkit )
	mkl? ( sci-libs/mkl )
	rocm? ( dev-util/rocm-smi )
	vulkan? ( media-libs/vulkan-loader )
"
#	sycl? ( llvm-core/dpcpp )
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	if use kompute ; then
		rmdir src/ggml-kompute/kompute
		ln -sv "${WORKDIR}"/kompute-${KOMPUTE_COMMIT} src/ggml-kompute/kompute
	fi
	cmake_src_prepare
}

src_configure() {
	#if use sycl ; then
	#	export CC=icx
	#	export CXX=icpx
	#	filter-flags '-mabm'
	#	filter-flags '--param=l1-cache-*'
	#	filter-flags '--param=l2-cache-*'
	#fi
	local blas_vendor="Generic"
	if use cuda ; then
		blas_vendor="NVHPC"
	elif use mkl ; then
		blas_vendor="Intel"
	fi
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=ON
		-DGGML_BLAS=ON
		-DGGML_BLAS_VENDOR=${blas_vendor}
		-DGGML_CUDA=$(usex cuda)
		-DGGML_HIP=$(usex rocm)
		-DGGML_VULKAN=$(usex vulkan)
		-DGGML_KOMPUTE=$(usex kompute)
		-DGGML_OPENMP=$(usex openmp)
		#-DGGML_SYCL=$(usex sycl)
		#-DGGML_OPENCL=$(usex opencl)
		-DGGML_BUILD_TESTS=OFF
		-DGGML_BUILD_EXAMPLES=OFF
	)
	cmake_src_configure
}
