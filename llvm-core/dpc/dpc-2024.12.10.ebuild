# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake multilib-minimal
inherit toolchain-funcs

MY_PV=${PV//./-}

VC_INTRINSICS_COMMIT="4e51b2467104a257c22788e343dafbdde72e28bb"
#UNIFIED_RUNTIME_COMMIT="098deca1f9f3b9f3f0563ee823ac424d8db30668"
UNIFIED_RUNTIME_PV="0.11.0"
COMPUTE_RUNTIME_PV="24.39.31294.12"
BOOST_MP11_COMMIT="863d8b8d2b20f2acd0b5870f23e553df9ce90e6c"
BOOST_UNORDERED_COMMIT="5e6b9291deb55567d41416af1e77c2516dc1250f"
BOOST_ASSERT_COMMIT="447e0b3a331930f8708ade0e42683d12de9dfbc3"
BOOST_CONFIG_COMMIT="11385ec21012926e15a612e3bf9f9a71403c1e5b"
BOOST_CONTAINER_HASH_COMMIT="6d214eb776456bf17fbee20780a034a23438084f"
BOOST_CORE_COMMIT="083b41c17e34f1fc9b43ab796b40d0d8bece685c"
BOOST_DESCRIBE_COMMIT="50719b212349f3d1268285c586331584d3dbfeb5"
BOOST_PREDEF_COMMIT="0fdfb49c3a6789e50169a44e88a07cc889001106"
BOOST_STATIC_ASSERT_COMMIT="ba72d3340f3dc6e773868107f35902292f84b07e"
BOOST_THROW_EXCEPTION_COMMIT="7c8ec2114bc1f9ab2a8afbd629b96fbdd5901294"
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
	https://github.com/oneapi-src/unified-runtime/archive/refs/tags/v${UNIFIED_RUNTIME_PV}.tar.gz -> unified-runtime-${UNIFIED_RUNTIME_PV}.gh.tar.gz
	https://github.com/intel/compute-runtime/archive/${COMPUTE_RUNTIME_PV}.tar.gz -> intel-compute-runtime-${COMPUTE_RUNTIME_PV}.tar.gz
	https://github.com/boostorg/mp11/archive/${BOOST_MP11_COMMIT}.tar.gz -> boost-mp11-${BOOST_MP11_COMMIT}.gh.tar.gz
	https://github.com/boostorg/unordered/archive/${BOOST_UNORDERED_COMMIT}.tar.gz -> boost-unordered-${BOOST_UNORDERED_COMMIT}.gh.tar.gz
	https://github.com/boostorg/assert/archive/${BOOST_ASSERT_COMMIT}.tar.gz -> boost-assert-${BOOST_ASSERT_COMMIT}.gh.tar.gz
	https://github.com/boostorg/config/archive/${BOOST_CONFIG_COMMIT}.tar.gz -> boost-config-${BOOST_CONFIG_COMMIT}.gh.tar.gz
	https://github.com/boostorg/container_hash/archive/${BOOST_CONTAINER_HASH_COMMIT}.tar.gz -> boost-container_hash-${BOOST_CONTAINER_HASH_COMMIT}.tar.gz
	https://github.com/boostorg/core/archive/${BOOST_CORE_COMMIT}.tar.gz -> boost-core-${BOOST_CORE_COMMIT}.gh.tar.gz
	https://github.com/boostorg/describe/archive/${BOOST_DESCRIBE_COMMIT}.tar.gz -> boost-describe-${BOOST_DESCRIBE_COMMIT}.gh.tar.gz
	https://github.com/boostorg/predef/archive/${BOOST_PREDEF_COMMIT}.tar.gz -> boost-predef-${BOOST_PREDEF_COMMIT}.gh.tar.gz
	https://github.com/boostorg/static_assert/archive/${BOOST_STATIC_ASSERT_COMMIT}.tar.gz -> static_assert-${BOOST_STATIC_ASSERT_COMMIT}.gh.tar.gz
	https://github.com/boostorg/throw_exception/archive/${BOOST_THROW_EXCEPTION_COMMIT}.tar.gz -> boost-throw_exception-${BOOST_THROW_EXCEPTION_COMMIT}.gh.tar.gz
	https://github.com/ktprime/emhash/archive/${EMHASH_COMMIT}.tar.gz -> emhash-${EMHASH_COMMIT}.gh.tar.gz
	https://github.com/greg7mdp/parallel-hashmap/archive/${PARALLEL_HASHMAP_COMMIT}.tar.gz -> parallel-hashmap-${PARALLEL_HASHMAP_COMMIT}.gh.tar.gz
"
#https://github.com/oneapi-src/unified-runtime/archive/${UNIFIED_RUNTIME_COMMIT}.tar.gz -> unified-runtime-${UNIFIED_RUNTIME_COMMIT}.gh.tar.gz

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
#IUSE="cuda jit l0 opencl rocm zstd"
IUSE="cuda jit l0 opencl rocm"

DEPEND="
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
	eapply "${FILESDIR}"/umf-install.patch
	eapply "${FILESDIR}"/xptifw-dep.patch
	pushd "${WORKDIR}"/unified-runtime-${UNIFIED_RUNTIME_PV} \
	&& eapply "${FILESDIR}"/unified-runtime-system-umf.patch \
	&& eapply "${FILESDIR}"/unified-runtime-level-zero.patch \
	&& popd
	cmake_src_prepare
}

multilib_src_configure() {
	local targets="host"
	local external_projects="sycl;llvm-spirv;opencl;xpti;xptifw;libdevice"
	local enable_projects="clang;${external_projects};libclc"
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
		#-DLLVM_EXTERNAL_SYCL_JIT_SOURCE_DIR="${S}"/sycl-jit
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
		-DSYCL_UR_USE_FETCH_CONTENT=OFF
		-DSYCL_UR_SOURCE_DIR="${WORKDIR}/unified-runtime-${UNIFIED_RUNTIME_PV}"
		-DUR_BUILD_EXAMPLES=OFF
		-DUR_BUILD_TESTS=OFF
		-DUR_BUILD_ADAPTER_L0=$(usex l0)
		-DUR_LEVEL_ZERO_LOADER_LIBRARY=/usr/$(get_libdir)/libze_loader.so
		-DUR_LEVEL_ZERO_INCLUDE_DIR=/usr/include/level_zero
		-DUR_COMPUTE_RUNTIME_DIR="${WORKDIR}"/compute-runtime-${COMPUTE_RUNTIME_PV}
		-DUR_BUILD_ADAPTER_OPENCL=$(usex opencl)
		-DUR_BUILD_ADAPTER_CUDA=$(usex cuda)
		-DUR_BUILD_ADAPTER_HIP=$(usex rocm)
		-DUR_BUILD_ADAPTER_NATIVE_CPU=ON
		-DBOOST_MP11_SOURCE_DIR="${WORKDIR}/mp11-${BOOST_MP11_COMMIT}"
		-DBOOST_UNORDERED_SOURCE_DIR=${WORKDIR}/unordered-${BOOST_UNORDERED_COMMIT}
		-DBOOST_ASSERT_SOURCE_DIR=${WORKDIR}/assert-${BOOST_ASSERT_COMMIT}
		-DBOOST_CONFIG_SOURCE_DIR=${WORKDIR}/config-${BOOST_CONFIG_COMMIT}
		-DBOOST_CONTAINER_HASH_SOURCE_DIR=${WORKDIR}/container_hash-${BOOST_CONTAINER_HASH_COMMIT}
		-DBOOST_CORE_SOURCE_DIR=${WORKDIR}/core-${BOOST_CORE_COMMIT}
		-DBOOST_DESCRIBE_SOURCE_DIR=${WORKDIR}/describe-${BOOST_DESCRIBE_COMMIT}
		-DBOOST_PREDEF_SOURCE_DIR=${WORKDIR}/predef-${BOOST_PREDEF_COMMIT}
		-DBOOST_STATIC_ASSERT_SOURCE_DIR=${WORKDIR}/static_assert-${BOOST_STATIC_ASSERT_COMMIT}
		-DBOOST_THROW_EXCEPTION_SOURCE_DIR=${WORKDIR}/throw_exception-${BOOST_THROW_EXCEPTION_COMMIT}
		-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR="/usr/include"
		-DEMHASH_SOURCE_DIR=${WORKDIR}/emhash-${EMHASH_COMMIT}
		-DPARALLEL_HASHMAP_SOURCE_DIR=${WORKDIR}/parallel-hashmap-${PARALLEL_HASHMAP_COMMIT}
		-DSYCL_ENABLE_XPTI_TRACING=OFF
	)
	use opencl && mycmakeargs+=( -DUR_OPENCL_INCLUDE_DIR="/usr/include" )
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
