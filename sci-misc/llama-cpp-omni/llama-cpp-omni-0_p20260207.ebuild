# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ROCM_VERSION="6.3"

inherit cmake cuda rocm linux-info flag-o-matic

EGIT_COMMIT="bb76f3d7f57f23a69c5ad537de36166219394722"

DESCRIPTION="A high-performance Omni multimodal inference engine built on llama.cpp"
HOMEPAGE="https://github.com/tc-mb/llama.cpp-omni"
SRC_URI="https://github.com/tc-mb/llama.cpp-omni/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="openblas blis +openmp cuda opencl +openmp rocm -sycl test vulkan flexiblas wmma ssl test"

CPU_FLAGS_X86=( avx avx2 f16c )

CDEPEND="
	openblas? ( sci-libs/openblas:= )
	blis? ( sci-libs/blis:= )
	flexiblas? ( sci-libs/flexiblas:= )
	openmp? ( llvm-runtimes/openmp:= )
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
	rocm? (
		>=dev-util/hip-${ROCM_VERSION}:=
		>=sci-libs/hipBLAS-${ROCM_VERSION}:=
		wmma? (
			>=sci-libs/rocWMMA-${ROCM_VERSION}:=
		)
	)
	sycl? (
		llvm-core/dpcpp[cuda?,rocm?]
		sci-ml/oneDNN[mkl,sycl]
	)
	vulkan? ( media-libs/vulkan-loader )
"
DEPEND="${CDEPEND}
	opencl? ( dev-util/opencl-headers )
	vulkan? ( dev-util/vulkan-headers )
"
RDEPEND="${CDEPEND}
	opencl? ( dev-libs/opencl-icd-loader )
	vulkan? ( media-libs/vulkan-loader )
"
BDEPEND=""

REQUIRED_USE="
	?? (
		openblas
		blis
		flexiblas
	)
	wmma? (
		rocm
	)
"

S="${WORKDIR}"/llama.cpp-omni-${EGIT_COMMIT}

pkg_setup() {
	if use rocm; then
		linux-info_pkg_setup
		if linux-info_get_any_version && linux_config_exists; then
			if ! linux_chkconfig_present HSA_AMD_SVM; then
				ewarn "To use ROCm/HIP, you need to have HSA_AMD_SVM option enabled in your kernel."
			fi
		fi
	fi
}

src_prepare() {
	use cuda && cuda_src_prepare
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DGGML_NATIVE=0 # don't set march
		-DGGML_RPC=ON
		-DGGML_CUDA=$(usex cuda)
		-DGGML_OPENCL=$(usex opencl)
		-DGGML_VULKAN=$(usex vulkan)
		-DGGML_OPENMP=$(usex openmp)
		-DGGML_SYCL=$(usex sycl)
		-DGGML_BUILD_TESTS=OFF
		-DGGML_BUILD_EXAMPLES=OFF
		-DLLAMA_USE_SYSTEM_GGML=OFF
		-DBUILD_SHARED_LIBS=OFF
		-DLLAMA_BUILD_TESTS=OFF
		-DLLAMA_CURL=ON
		-DLLAMA_BUILD_TESTS=$(usex test)
		-DLLAMA_OPENSSL=$(usex ssl)
	)
	if use openblas ; then
		mycmakeargs+=(
			-DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS
		)
	fi

	if use blis ; then
		mycmakeargs+=(
			-DGGML_BLAS=ON -DGGML_BLAS_VENDOR=FLAME
		)
	fi

	if use flexiblas; then
		mycmakeargs+=(
			-DGGML_BLAS=ON -DGGML_BLAS_VENDOR=FlexiBLAS
		)
	fi

	if use cuda; then
		local -x CUDAHOSTCXX="$(cuda_gccdir)"
		# tries to recreate dev symlinks
		cuda_add_sandbox
		addpredict "/dev/char/"
	fi

	if use rocm; then
		rocm_use_hipcc
		mycmakeargs+=(
			-DGGML_HIP=ON -DAMDGPU_TARGETS=$(get_amdgpu_flags)
			-DGGML_HIP_ROCWMMA_FATTN=$(usex wmma)
		)
	fi
	cmake_src_configure
}

src_compile() {
	cmake_src_compile llama-omni-cli
}

src_install() {
	dobin ${BUILD_DIR}/bin/llama-omni-cli
	einstalldocs
}
