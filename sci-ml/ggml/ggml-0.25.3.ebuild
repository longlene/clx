# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ROCM_VERSION="7.2"
inherit cmake cuda rocm toolchain-funcs

DESCRIPTION="Tensor library for machine learning"
HOMEPAGE="https://ggml.ai/"
SRC_URI="
	https://github.com/ggml-org/ggml/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm64"

X86_CPU_FLAGS=(
	avx
	avx_vnni
	avx2
	avx512_bf16
	avx512bw
	avx512f
	avx512vbmi
	avx512_vnni
	bmi2
	fma3
	f16c
	sse4_2
)
CPU_FLAGS=( "${X86_CPU_FLAGS[@]/#/cpu_flags_x86_}" )
IUSE="${CPU_FLAGS[*]} cuda openmp openvino rocm test vulkan"

REQUIRED_USE="rocm? ( ${ROCM_REQUIRED_USE} )"

RESTRICT="!test? ( test )"


CDEPEND="
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
	openvino? (
		sci-ml/openvino
	)
	rocm? (
		>=dev-util/hip-${ROCM_VERSION}:=
		>=sci-libs/hipBLAS-${ROCM_VERSION}:=
	)
	vulkan? ( media-libs/vulkan-loader )
"
DEPEND="${CDEPEND}
	openvino? ( dev-util/opencl-headers )
	vulkan? ( dev-util/vulkan-headers )
"

pkg_setup() {
	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

src_prepare() {
	cmake_src_prepare
	use cuda && cuda_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DGGML_BUILD_EXAMPLES=OFF
		-DGGML_NATIVE=OFF
		-DGGML_RPC=ON

		# CPU Flags
		-DGGML_AVX=$(usex cpu_flags_x86_avx)
		-DGGML_AVX_VNNI=$(usex cpu_flags_x86_avx_vnni)
		-DGGML_AVX2=$(usex cpu_flags_x86_avx2)
		-DGGML_AVX512_BF16=$(usex cpu_flags_x86_avx512_bf16)
		-DGGML_AVX512_VBMI=$(usex cpu_flags_x86_avx512vbmi)
		-DGGML_AVX512_VNNI=$(usex cpu_flags_x86_avx512_vnni)
		-DGGML_BMI2=$(usex cpu_flags_x86_bmi2)
		-DGGML_FMA=$(usex cpu_flags_x86_fma3)
		-DGGML_F16C=$(usex cpu_flags_x86_f16c)
		-DGGML_SSE42=$(usex cpu_flags_x86_sse4_2)

		-DGGML_CUDA=$(usex cuda)
		-DGGML_OPENMP=$(usex openmp)
		-DGGML_OPENVINO=$(usex openvino)
		-DGGML_VULKAN=$(usex vulkan)

		-DGGML_BUILD_TESTS=$(usex test)
	)

	if use cpu_flags_x86_avx512f || use cpu_flags_x86_avx512bw; then
		mycmakeargs+=( -DGGML_AVX512=ON )
	else
		mycmakeargs+=( -DGGML_AVX512=OFF )
	fi

	if use cuda; then
		mycmakeargs+=( -DGGML_CUDA_NCCL=OFF )

		# cuda.eclass's cuda_gccdir() hardcodes a "*pc-linux-gnu" bindir
		# pattern and returns a directory, not a compiler executable.
		# That breaks on non-x86 CHOSTs (e.g. aarch64-unknown-linux-gnu)
		# and doesn't satisfy CMake's FindCUDAToolkit, which requires
		# CUDAHOSTCXX to point at an actual compiler binary. Work it out
		# directly here instead.
		local -x CUDAHOSTCXX
		local cuda_vers cuda_ver gcc_bindir
		cuda_vers="$(cuda-config -s)" || die "cuda-config not found"
		for cuda_ver in ${cuda_vers}; do
			if has_version "=sys-devel/gcc-${cuda_ver}*"; then
				gcc_bindir="${EPREFIX}/usr/${CHOST}/gcc-bin/${cuda_ver%.*}"
			fi
		done
		[[ -d ${gcc_bindir} ]] || die "No installed gcc is compatible with CUDA (supported: ${cuda_vers})"
		CUDAHOSTCXX="${gcc_bindir}/gcc"
		[[ -x ${CUDAHOSTCXX} ]] || die "CUDAHOSTCXX is not executable: ${CUDAHOSTCXX}"

		# tries to recreate dev symlinks
		cuda_add_sandbox -w
		addpredict "/dev/char/"
	fi

	if use rocm; then
		rocm_use_hipcc
		mycmakeargs+=(
			-DGGML_HIP=ON
			-DAMDGPU_TARGETS=$(get_amdgpu_flags)
		)
	fi

	cmake_src_configure
}
