# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
inherit cmake multilib-minimal python-any-r1

VC_INTRINSICS_COMMIT="4e51b2467104a257c22788e343dafbdde72e28bb"
BOOST_MP11_COMMIT="863d8b8d2b20f2acd0b5870f23e553df9ce90e6c"
EMHASH_COMMIT="96dcae6fac2f5f90ce97c9efee61a1d702ddd634"

DESCRIPTION="oneAPI Data Parallel C++ compiler"
HOMEPAGE="
	https://www.intel.com/content/www/us/en/developer/tools/oneapi/dpc-compiler.html
	https://github.com/intel/llvm
"
SRC_URI="
	https://github.com/intel/llvm/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/intel/vc-intrinsics/archive/${VC_INTRINSICS_COMMIT}.tar.gz -> vc-intrinsics-${VC_INTRINSICS_COMMIT}.gh.tar.gz
	https://github.com/boostorg/mp11/archive/${BOOST_MP11_COMMIT}.tar.gz -> boost-mp11-${BOOST_MP11_COMMIT}.gh.tar.gz
	https://github.com/ktprime/emhash/archive/${EMHASH_COMMIT}.tar.gz -> emhash-${EMHASH_COMMIT}.gh.tar.gz
"


LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda +jit l0 rocm"

DEPEND="
	app-arch/zstd
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
"

S="${WORKDIR}"/llvm-${PV}
CMAKE_USE_DIR="${S}"/llvm

src_prepare() {
	default
	eapply \
		"${FILESDIR}"/system-opencl.patch \
		"${FILESDIR}"/${PV}-system-unified-runtime.patch \
		"${FILESDIR}"/system-level-zero.patch \
		"${FILESDIR}"/system-boost.patch \
		"${FILESDIR}"/system-zstd.patch \
		"${FILESDIR}"/system-cuda.patch \
		"${FILESDIR}"/xptifw-dep.patch \
		"${FILESDIR}"/${PV}-disable-float128.patch
	cmake_src_prepare
}

multilib_src_configure() {
	local llvm_targets=( "host" )
	local llvm_external_projects=( "sycl" "llvm-spirv" "opencl" "xpti" "xptifw" "libdevice" )
	local llvm_enable_projects=("clang" "${llvm_external_projects[@]}")
	local sycl_enable_backends=( "opencl" )
	local libclc_targets=()

	use jit && llvm_external_projects+=( "sycl-jit" )

	if use cuda ; then
		llvm_targets+=( "NVPTX" )
		llvm_enable_projects+=( "libclc" )
		sycl_enable_backends+=( "cuda" )
		libclc_targets+=(
			"nvptx--"
			"nvptx64--"
			"nvptx--nvidiacl"
			"nvptx64--nvidiacl"
		)
	fi
	use l0 && sycl_enable_backends+=( "level_zero" )

	if use rocm ; then
		llvm_targets+=( "AMDGPU" )
		llvm_enable_projects+=( "libclc" "lld" )
		sycl_enable_backends+=( "hip" )
		libclc_targets+=(
			"amdgcn--amdhsa"
		)
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

		-DBOOST_MP11_SOURCE_DIR="${WORKDIR}/mp11-${BOOST_MP11_COMMIT}"
		-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR="/usr/include"
		-DEMHASH_SOURCE_DIR=${WORKDIR}/emhash-${EMHASH_COMMIT}
		-DPARALLEL_HASHMAP_SOURCE_DIR="/usr/include"
		-DLLVMGenXIntrinsics_SOURCE_DIR="${WORKDIR}"/vc-intrinsics-${VC_INTRINSICS_COMMIT}
		-DSYCL_UR_USE_FETCH_CONTENT=OFF
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
	use cuda && mycmakeargs+=(
		-DLIBCLC_GENERATE_REMANGLED_VARIANTS=ON
	)
	use l0 && mycmakeargs+=(
		-DLEVEL_ZERO_INCLUDE_DIR="/usr/include/level_zero"
	)
	use rocm && mycmakeargs+=(
		-DSYCL_BUILD_PI_HIP_PLATFORM="AMD"
	)
	if [[ ${#libclc_targets[@]} ]] ; then
		libclc_targets=${libclc_targets[*]}
		mycmakeargs+=(
			-DLIBCLC_TARGETS_TO_BUILD="${libclc_targets// /;}"
		)
	fi

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
