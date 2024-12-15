# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake multilib-minimal
inherit toolchain-funcs

MY_PV=${PV//./-}

VC_INTRINSICS_COMMIT="4e51b2467104a257c22788e343dafbdde72e28bb"
BOOST_MP11_COMMIT="863d8b8d2b20f2acd0b5870f23e553df9ce90e6c"
EMHASH_COMMIT="96dcae6fac2f5f90ce97c9efee61a1d702ddd634"
PARALLEL_HASHMAP_COMMIT="8a889d3699b3c09ade435641fb034427f3fd12b6"

DESCRIPTION="oneAPI DPC++ compiler"
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
#IUSE="cuda jit l0 opencl rocm zstd"
IUSE="cuda jit l0 opencl rocm"

DEPEND="
	dev-libs/boost
	dev-libs/level-zero
	dev-libs/unified-runtime
	cuda? ( dev-util/nvidia-cuda-toolkit )
	l0? ( dev-libs/level-zero )
	opencl? ( >=dev-libs/opencl-icd-loader-2024.10.24 )
"
RDEPEND="${DEPEND}
"
#zstd? ( app-arch/zstd:=[${MULTILIB_USEDEP}] )
BDEPEND=""

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
	#local external_projects="sycl;llvm-spirv;opencl;xpti;xptifw;libdevice"
	local external_projects="sycl;llvm-spirv;opencl;libdevice"
	#local enable_projects="clang;${external_projects};libclc"
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
		-DCMAKE_INSTALL_PREFIX="${EPREFIX}"/usr/lib/llvm/intel
		-DLLVM_LIBDIR_SUFFIX=${libdir#lib}
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
		-DSYCL_ENABLE_WERROR=OFF
		-DSYCL_INCLUDE_TESTS=OFF
		-DLLVM_ENABLE_DOXYGEN=OFF
		-DLLVM_ENABLE_SPHINX=OFF
		-DBUILD_SHARED_LIBS=OFF
		-DSYCL_ENABLE_XPTI_TRACING=ON
		-DLLVM_ENABLE_LLD=OFF
		-DXPTI_ENABLE_WERROR=OFF
		#-DSYCL_CLANG_EXTRA_FLAGS=""
		-DSYCL_ENABLE_BACKENDS=${sycl_backends}
		-DSYCL_ENABLE_EXTENSION_JIT=$(usex jit)
		-DSYCL_ENABLE_MAJOR_RELEASE_PREVIEW_LIB=ON
		-DBUG_REPORT_URL="https://github.com/intel/llvm/issues"
		-DOCAMLFIND=NO
		-DLLVMGenXIntrinsics_SOURCE_DIR="${WORKDIR}/vc-intrinsics-${VC_INTRINSICS_COMMIT}"
		-DBOOST_MP11_SOURCE_DIR="${WORKDIR}/mp11-${BOOST_MP11_COMMIT}"
		-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR="/usr/include"
		-DEMHASH_SOURCE_DIR=${WORKDIR}/emhash-${EMHASH_COMMIT}
		#-DPARALLEL_HASHMAP_SOURCE_DIR=${WORKDIR}/parallel-hashmap-${PARALLEL_HASHMAP_COMMIT}
		-DPARALLEL_HASHMAP_SOURCE_DIR="/usr/include"
		-DSYCL_ENABLE_XPTI_TRACING=OFF
	)
	#use opencl && mycmakeargs+=( -DUR_OPENCL_INCLUDE_DIR="/usr/include" )
	cmake_src_configure
}

multilib_src_compile() {
	tc-env_build cmake_build
}

src_install() {
	local MULTILIB_CHOST_TOOLS=(
		/usr/lib/llvm/intel/bin/llvm-config
	)

	#local MULTILIB_WRAPPED_HEADERS=(
	#	/usr/include/llvm/Config/llvm-config.h
	#)

	local LLVM_LDPATHS=()
	multilib-minimal_src_install

	# move wrapped headers back
	#mv "${ED}"/usr/include "${ED}"/usr/lib/llvm/intel/include || die
}

multilib_src_install() {
	DESTDIR=${D} cmake_build install

	## move headers to /usr/include for wrapping
	#rm -rf "${ED}"/usr/include || die
	#mv "${ED}"/usr/lib/llvm/intel/include "${ED}"/usr/include || die

	LLVM_LDPATHS+=( "${EPREFIX}/usr/lib/llvm/intel/$(get_libdir)" )
}

multilib_src_install_all() {
	newenvd - "60llvm-intel" <<-_EOF_
		PATH="${EPREFIX}/usr/lib/llvm/intel/bin"
		# we need to duplicate it in ROOTPATH for Portage to respect...
		ROOTPATH="${EPREFIX}/usr/lib/llvm/intel/bin"
		MANPATH="${EPREFIX}/usr/lib/llvm/intel/share/man"
		LDPATH="$( IFS=:; echo "${LLVM_LDPATHS[*]}" )"
	_EOF_
}
