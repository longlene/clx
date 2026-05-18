# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
inherit cmake flag-o-matic llvm-utils multilib-minimal python-any-r1

MY_PV=${PV//./-}

VC_INTRINSICS_COMMIT="4fc83e12979096db72c129bd432238d5ca397e4d"

DESCRIPTION="oneAPI Data Parallel C++ compiler"
HOMEPAGE="
	https://www.intel.com/content/www/us/en/developer/tools/oneapi/dpc-compiler.html
	https://github.com/intel/llvm
"
SRC_URI="
	https://github.com/intel/llvm/archive/refs/tags/nightly-${MY_PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/intel/vc-intrinsics/archive/${VC_INTRINSICS_COMMIT}.tar.gz -> vc-intrinsics-${VC_INTRINSICS_COMMIT}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda +jit l0 rocm"

DEPEND="
	app-arch/zstd
	dev-cpp/emhash
	dev-cpp/parallel-hashmap
	dev-libs/boost
	dev-libs/unified-runtime[opencl,cuda?,rocm?]
	>=dev-libs/opencl-icd-loader-2024.10.24
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
	rocm? ( dev-util/rocm-smi:= )
	l0? ( dev-libs/level-zero )
"
RDEPEND="${DEPEND}"
BDEPEND="
	${PYTHON_DEPS}
	llvm-core/clang
"

S="${WORKDIR}"/llvm-nightly-${MY_PV}

CMAKE_USE_DIR="${S}"/llvm

src_prepare() {
	default
	eapply \
		"${FILESDIR}"/system-opencl.patch \
		"${FILESDIR}"/system-unified-runtime.patch \
		"${FILESDIR}"/system-zstd.patch \
		"${FILESDIR}"/system-cuda.patch \
		"${FILESDIR}"/system-emhash.patch \
		"${FILESDIR}"/system-l0.patch
	cmake_src_prepare
}

multilib_src_configure() {
	# libclc CMakeDetermineCLCCompiler requires Clang as the C compiler
	local -x CC=clang
	local -x CXX=clang++
	llvm_fix_clang_version CC CXX
	# CFLAGS may contain GCC-only flags (-mabm, --param=*, etc.) that clang rejects
	strip-unsupported-flags

	local llvm_targets=( "host" )
	# libclc is now a runtime; keep external_projects for the other Intel sub-projects
	local llvm_external_projects=( "sycl" "llvm-spirv" "opencl" "xpti" "xptifw" "libdevice" )
	local sycl_enable_backends=( "opencl" )
	# "default" is required for non-libclc runtimes; GPU triples are appended below
	local llvm_runtime_targets=( "default" )

	use jit && llvm_external_projects+=( "sycl-jit" )

	# Build llvm_enable_projects after all external projects are finalised
	local llvm_enable_projects=( "clang" "${llvm_external_projects[@]}" )

	if use cuda ; then
		llvm_targets+=( "NVPTX" )
		sycl_enable_backends+=( "cuda" )
		llvm_runtime_targets+=( "nvptx64-nvidia-cuda" )
	fi
	use l0 && sycl_enable_backends+=( "level_zero" )

	if use rocm ; then
		llvm_targets+=( "AMDGPU" )
		llvm_enable_projects+=( "lld" )
		sycl_enable_backends+=( "hip" )
		llvm_runtime_targets+=( "amdgcn-amd-amdhsa-llvm" )
	fi

	llvm_targets=${llvm_targets[*]}
	llvm_external_projects=${llvm_external_projects[*]}
	llvm_enable_projects=${llvm_enable_projects[*]}
	sycl_enable_backends=${sycl_enable_backends[*]}

	local libdir=$(get_libdir)
	local mycmakeargs=(
		-DLLVM_APPEND_VC_REV=OFF
		-DCMAKE_INSTALL_PREFIX="${EPREFIX}"/usr/lib/llvm/intel
		-DLLVM_LIBDIR_SUFFIX=${libdir#lib}

		-DLLVM_TARGETS_TO_BUILD=${llvm_targets// /;}
		-DLLVM_EXTERNAL_PROJECTS="${llvm_external_projects// /;}"
		-DLLVM_EXTERNAL_SYCL_SOURCE_DIR="${S}"/sycl
		-DLLVM_EXTERNAL_LLVM_SPIRV_SOURCE_DIR="${S}"/llvm-spirv
		-DLLVM_EXTERNAL_XPTI_SOURCE_DIR="${S}"/xpti
		-DXPTI_SOURCE_DIR="${S}"/xpti
		-DLLVM_EXTERNAL_XPTIFW_SOURCE_DIR="${S}"/xptifw
		-DLLVM_EXTERNAL_LIBDEVICE_SOURCE_DIR="${S}"/libdevice
		-DLLVM_EXTERNAL_SYCL_JIT_SOURCE_DIR="${S}"/sycl-jit
		-DLLVM_ENABLE_PROJECTS="${llvm_enable_projects// /;}"
		-DLLVM_BUILD_TOOLS=ON
		-DLLVM_ENABLE_ZSTD=ON
		-DLLVM_USE_STATIC_ZSTD=OFF

		-DLLVM_HOST_TRIPLE="${CHOST}"
		-DPython3_EXECUTABLE="${PYTHON}"

		-DSYCL_COMPILER_VERSION="${MY_PV//-/}"
		-DSYCL_ENABLE_WERROR=OFF
		-DSYCL_INCLUDE_TESTS=OFF
		-DLLVM_ENABLE_DOXYGEN=OFF
		-DLLVM_ENABLE_SPHINX=OFF
		-DLLVM_ENABLE_OCAMLDOC=OFF
		-DLLVM_ENABLE_BINDINGS=OFF
		-DBUILD_SHARED_LIBS=OFF
		-DSYCL_ENABLE_XPTI_TRACING=ON
		-DLLVM_ENABLE_LLD=OFF
		-DXPTI_ENABLE_WERROR=OFF
		-DXPTI_ENABLE_TESTS=OFF
		-DSYCL_ENABLE_BACKENDS=${sycl_enable_backends// /;}
		-DSYCL_ENABLE_EXTENSION_JIT=$(usex jit)
		-DSYCL_ENABLE_MAJOR_RELEASE_PREVIEW_LIB=ON
		-DBUG_REPORT_URL="https://github.com/intel/llvm/issues"
		-DOCAMLFIND=OFF

		#-DBOOST_MP11_SOURCE_DIR="${WORKDIR}/mp11-${BOOST_MP11_COMMIT}"
		-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR="/usr/include"
		#-DEMHASH_SOURCE_DIR=${WORKDIR}/emhash-${EMHASH_COMMIT}
		#-DPARALLEL_HASHMAP_SOURCE_DIR="/usr/include"
		#-DVC_INTRINSICS_DIR="${WORKDIR}"/vc-intrinsics-${VC_INTRINSICS_COMMIT}
		-DFETCHCONTENT_SOURCE_DIR_VC-INTRINSICS="${WORKDIR}"/vc-intrinsics-${VC_INTRINSICS_COMMIT}
	)
	local suffix=
	if [[ $(tc-get-cxx-stdlib) == libc++ ]]; then
		suffix+="+libcxx"
		mycmakeargs+=(
			-DLLVM_ENABLE_LIBCXX=ON
		)
	fi
	mycmakeargs+=(
		-DLLVM_VERSION_SUFFIX="${suffix}"
	)
	use l0 && mycmakeargs+=(
		-DLEVEL_ZERO_INCLUDE_DIR="/usr/include/level_zero"
	)
	use rocm && mycmakeargs+=(
		-DSYCL_BUILD_PI_HIP_PLATFORM="AMD"
	)
	# libclc is now built as a per-target runtime; "default" covers non-GPU runtimes
	local rt_str="${llvm_runtime_targets[*]}"
	mycmakeargs+=( -DLLVM_RUNTIME_TARGETS="${rt_str// /;}" )
	# For each GPU target, enable libclc and point it at system LLVM tools so
	# AddLibclc.cmake's $<TARGET_FILE:opt>/$<TARGET_FILE:llvm-link> generator
	# expressions resolve without needing opt/llvm-link as cmake build targets.
	for rt in "${llvm_runtime_targets[@]}" ; do
		[[ ${rt} == "default" ]] && continue
		mycmakeargs+=(
			"-DRUNTIMES_${rt}_LLVM_ENABLE_RUNTIMES=libclc"
			"-DRUNTIMES_${rt}_LLVM_NATIVE_TOOL_DIR=${BUILD_DIR}/bin"
			"-DRUNTIMES_${rt}_LLVM_INCLUDE_TESTS=OFF"
		)
	done

	cmake_src_configure
}

multilib_src_compile() {
	local targets=( sycl-toolchain )
	use cuda && targets+=( clang-nvlink-wrapper )
	tc-env_build cmake_build ${targets[@]}
}

multilib_src_test() {
	# respect TMPDIR!
	local -x LIT_PRESERVES_TMP=1
	cmake_build check
}

multilib_src_install() {
	DESTDIR=${D} cmake_build deploy-sycl-toolchain
}

multilib_src_install_all() {
	local INTEL_DIR="/usr/lib/llvm/intel"
	local libdir=$(get_libdir)

	dodir /usr/include
	mv "${ED}"${INTEL_DIR}/include/{sycl,CL,std,syclcompat,syclcompat.hpp} "${ED}"/usr/include
	dodir /usr/${libdir}
	mv "${ED}"${INTEL_DIR}/${libdir}/libsycl*.so* "${ED}"/usr/${libdir}
	dosym "${INTEL_DIR}"/bin/clang /usr/bin/icx
	dosym "${INTEL_DIR}"/bin/clang++ /usr/bin/icpx
	einstalldocs
}
