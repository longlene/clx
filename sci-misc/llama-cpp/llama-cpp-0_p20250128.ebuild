# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="a4417ddda98fd0558fb4d802253e68a933704b59"
KOMPUTE_COMMIT="4565194ed7c32d1d2efa32ceab4d3c6cae006306"

DESCRIPTION="Port of Facebook's LLaMA model in C/C++"
HOMEPAGE="https://github.com/ggerganov/llama.cpp"
SRC_URI="
	https://github.com/ggerganov/llama.cpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	kompute? ( https://github.com/nomic-ai/kompute/archive/${KOMPUTE_COMMIT}.tar.gz -> kompute-${KOMPUTE_COMMIT}.tar.gz )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="blas cuda kompute mkl opencl openmp rocm vulkan"

DEPEND="
	net-misc/curl
	blas? (
		mkl? ( sci-libs/mkl )
		!mkl? ( sci-libs/openblas:= )
	)
	cuda? ( dev-util/nvidia-cuda-toolkit )
	opencl? ( virtual/opencl )
	rocm? ( sci-libs/rocBLAS )
	vulkan? ( media-libs/vulkan-loader )
"
#	kompute? ( dev-libs/kompute )
#	sycl? ( llvm-core/dpcpp )
RDEPEND="${DEPEND}"
BEPEND=""

src_prepare() {
	default
	eapply "${FILESDIR}"/system-mkl.patch
	if use kompute ; then
		rmdir src/ggml-kompute/kompute
		ln -sv "${WORKDIR}"/kompute-${KOMPUTE_COMMIT} ggml/src/ggml-kompute/kompute
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
	local blas=OFF
	local blas_vendor="Generic"
	if use blas; then
		blas=ON
		if use cuda ; then
			blas_vendor="NVHPC"
		elif use mkl ; then
			blas_vendor="Intel"
		fi
	fi
	local mycmakeargs=(
		-DLLAMA_BUILD_TESTS=OFF
		-DLLAMA_CURL=ON
		-DGGML_BLAS=${blas}
		-DGGML_BLAS_VENDOR=${blas_vendor}
		-DGGML_CUDA=$(usex cuda)
		-DGGML_HIPBLAS=$(usex rocm)
		-DGGML_KOMPUTE=$(usex kompute)
		-DGGML_OPENCL=$(usex opencl)
		-DGGML_OPENMP=$(usex openmp)
		-DGGML_VULKAN=$(usex vulkan)
	)
	cmake_src_configure
}
