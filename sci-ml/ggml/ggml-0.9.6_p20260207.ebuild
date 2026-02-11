# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ROCM_VERSION="6.3"

inherit cmake cuda rocm linux-info flag-o-matic vcs-snapshot

EGIT_COMMIT="5cecdad692d868e28dbd2f7c468504770108f30c"

DESCRIPTION="Tensor library for machine learning"
HOMEPAGE="https://github.com/ggerganov/ggml"
SRC_URI="
	https://github.com/ggerganov/ggml/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="openblas blis +openmp cuda opencl +openmp rocm -sycl test vulkan flexiblas wmma"

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
		sci-ml/oneDNN[mkl,opencl,sycl]
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
	sycl? ( opencl )
"

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
	#default
	#eapply \
	#	"${FILESDIR}"/system-mkl.patch \
	#	"${FILESDIR}"/system-blas.patch \
	#	"${FILESDIR}"/header-install.patch
#		"${FILESDIR}"/system-sycl.patch
	#if use kompute ; then
	#	rmdir src/ggml-kompute/kompute
	#	ln -sv "${WORKDIR}"/kompute-${KOMPUTE_COMMIT} src/ggml-kompute/kompute
	#fi
	use cuda && cuda_src_prepare
	cmake_src_prepare
}

src_configure() {
	#local blas=OFF
	#local blas_vendor="Generic"
	#if use blas ; then
	#	blas=ON
	#	if use cuda ; then
	#		blas_vendor="NVHPC"
	#	elif use mkl ; then
	#		blas_vendor="Intel"
	#	fi
	#fi
	#local sycl_target="INTEL"
	#if use sycl ; then
	#	export CC=icx
	#	export CXX=icpx
	#	filter-flags '-mabm'
	#	filter-flags '--param=l1-cache-*'
	#	filter-flags '--param=l2-cache-*'
	#	if use cuda; then
	#		sycl_target="NVIDIA"
	#	elif use rocm; then
	#		sycl_target="AMD"
	#	fi
	#fi
	#local mycmakeargs=(
	#	-DBUILD_SHARED_LIBS=ON
	#	-DGGML_BLAS=${blas}
	#	-DGGML_BLAS_VENDOR=${blas_vendor}
	#	-DGGML_CUDA=$(usex cuda)
	#	-DGGML_HIP=$(usex rocm)
	#	-DGGML_HIPBLAS=$(usex rocm)
	#	-DGGML_VULKAN=$(usex vulkan)
	#	-DGGML_KOMPUTE=$(usex kompute)
	#	-DGGML_OPENMP=$(usex openmp)
	#	-DGGML_RPC=ON
	#	-DGGML_SYCL=$(usex sycl)
	#	-DGGML_SYCL_TARGET=${sycl_target}
	#	-DGGML_OPENCL=$(usex opencl)
	#	-DGGML_OPENCL_USE_ADRENO_KERNELS=OFF
	#	-DGGML_BUILD_TESTS=$(usex test)
	#	-DGGML_BUILD_EXAMPLES=OFF
	#	-DGGML_BUILD_NUMBER="${PV}"
	#)


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
