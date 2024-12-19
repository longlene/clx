# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
inherit cmake multilib-minimal python-any-r1

MY_PV=${PV//./-}

VC_INTRINSICS_COMMIT="4e51b2467104a257c22788e343dafbdde72e28bb"
BOOST_MP11_COMMIT="863d8b8d2b20f2acd0b5870f23e553df9ce90e6c"
EMHASH_COMMIT="96dcae6fac2f5f90ce97c9efee61a1d702ddd634"
PARALLEL_HASHMAP_COMMIT="8a889d3699b3c09ade435641fb034427f3fd12b6"

DESCRIPTION="oneAPI Data Parallel C++ compiler"
HOMEPAGE="
	https://www.intel.com/content/www/us/en/developer/tools/oneapi/dpc-compiler.html
	https://github.com/intel/llvm
"
SRC_URI="
	https://github.com/intel/llvm/archive/refs/tags/nightly-${MY_PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/intel/vc-intrinsics/archive/${VC_INTRINSICS_COMMIT}.tar.gz -> vc-intrinsics-${VC_INTRINSICS_COMMIT}.gh.tar.gz
	https://github.com/boostorg/mp11/archive/${BOOST_MP11_COMMIT}.tar.gz -> boost-mp11-${BOOST_MP11_COMMIT}.gh.tar.gz
	https://github.com/ktprime/emhash/archive/${EMHASH_COMMIT}.tar.gz -> emhash-${EMHASH_COMMIT}.gh.tar.gz
"
#	https://github.com/greg7mdp/parallel-hashmap/archive/${PARALLEL_HASHMAP_COMMIT}.tar.gz -> parallel-hashmap-${PARALLEL_HASHMAP_COMMIT}.gh.tar.gz

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
#IUSE="cuda hip +jit l0 opencl rocm zstd"
IUSE="cuda hip +jit l0 rocm"

DEPEND="
	dev-libs/boost
	dev-libs/level-zero
	dev-libs/unified-runtime
	>=dev-libs/opencl-icd-loader-2024.10.24
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
	hip? ( dev-util/rocm-smi:= )
	l0? ( dev-libs/level-zero )
"
RDEPEND="${DEPEND}
"
#zstd? ( app-arch/zstd:= )
BDEPEND="
	${PYTHON_DEPS}
"

S="${WORKDIR}"/llvm-nightly-${MY_PV}

CMAKE_USE_DIR="${S}"/llvm

src_prepare() {
	default
	eapply "${FILESDIR}"/system-opencl.patch
	eapply "${FILESDIR}"/xptifw-dep.patch
	eapply "${FILESDIR}"/system-unified-runtime.patch
	eapply "${FILESDIR}"/system-boost.patch
	cmake_src_prepare
}

multilib_src_configure() {
	local targets="host"
	local external_projects="sycl;llvm-spirv;opencl;libdevice;xpti;xptifw"
	local enable_projects="clang;${external_projects}"
	local sycl_backends="clang"

	if use cuda ; then
		targets+=";NVPTX"
		sycl_backends+=";cuda"
	fi

	use jit && external_projects+=";sycl-jit"
	use l0 && sycl_backends+=";opencl;level_zero"

	local libdir=$(get_libdir)
	local mycmakeargs=(
		-DLLVM_APPEND_VC_REV=OFF
		-DCMAKE_INSTALL_PREFIX="${EPREFIX}"/usr/lib/llvm/intel
		-DLLVM_LIBDIR_SUFFIX=${libdir#lib}

		#-DBUILD_SHARED_LIBS=OFF
		#-DLLVM_BUILD_LLVM_DYLIB=ON
		#-DLLVM_LINK_LLVM_DYLIB=ON

		-DLLVM_TARGETS_TO_BUILD=${targets}
		-DLLVM_EXTERNAL_PROJECTS=${external_projects}
		-DLLVM_EXTERNAL_SYCL_SOURCE_DIR="${S}"/sycl
		-DLLVM_EXTERNAL_LLVM_SPIRV_SOURCE_DIR="${S}"/llvm-spirv
		-DLLVM_EXTERNAL_XPTI_SOURCE_DIR="${S}"/xpti
		-DXPTI_SOURCE_DIR="${S}"/xpti
		-DLLVM_EXTERNAL_XPTIFW_SOURCE_DIR="${S}"/xptifw
		-DLLVM_EXTERNAL_LIBDEVICE_SOURCE_DIR="${S}"/libdevice
		-DLLVM_ENABLE_PROJECTS="clang;${external_projects}"
		-DSYCL_BUILD_PI_HIP_PLATFORM="AMD"
		-DLLVM_BUILD_TOOLS=ON
		#-DLLVM_ENABLE_ZSTD=$(usex zstd)
		-DLLVM_ENABLE_ZSTD=OFF
		-DLLVM_USE_STATIC_ZSTD=OFF

		-DLLVM_HOST_TRIPLE="${CHOST}"

		-DPython3_EXECUTABLE="${PYTHON}"

		-DSYCL_ENABLE_WERROR=OFF
		-DSYCL_INCLUDE_TESTS=OFF
		-DLLVM_ENABLE_DOXYGEN=OFF
		-DLLVM_ENABLE_SPHINX=OFF
		-DBUILD_SHARED_LIBS=OFF
		-DSYCL_ENABLE_XPTI_TRACING=ON
		-DLLVM_ENABLE_LLD=OFF
		-DXPTI_ENABLE_WERROR=OFF
		-DSYCL_ENABLE_BACKENDS=${sycl_backends}
		-DSYCL_ENABLE_EXTENSION_JIT=$(usex jit)
		-DSYCL_ENABLE_MAJOR_RELEASE_PREVIEW_LIB=ON

		-DBUG_REPORT_URL="https://github.com/intel/llvm/issues"
		-DOCAMLFIND=NO

		-DLLVMGenXIntrinsics_SOURCE_DIR="${WORKDIR}/vc-intrinsics-${VC_INTRINSICS_COMMIT}"
		-DBOOST_MP11_SOURCE_DIR="${WORKDIR}/mp11-${BOOST_MP11_COMMIT}"
		-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR="/usr/include"
		-DEMHASH_SOURCE_DIR=${WORKDIR}/emhash-${EMHASH_COMMIT}
		-DPARALLEL_HASHMAP_SOURCE_DIR="/usr/include"
		-DSYCL_ENABLE_XPTI_TRACING=OFF
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

	cmake_src_configure
}

multilib_src_compile() {
	tc-env_build cmake_build sycl-toolchain
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
	mv "${ED}"${INTEL_DIR}/${libdir}/libsycl*.{a,so*} "${ED}"/usr/${libdir}
	dosym "${INTEL_DIR}"/bin/clang /usr/bin/icx
	dosym "${INTEL_DIR}"/bin/clang++ /usr/bin/icpx
	einstalldocs
}
