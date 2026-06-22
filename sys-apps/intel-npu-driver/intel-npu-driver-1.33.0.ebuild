# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

NPU_COMPILER_ELF_COMMIT="82c444bcb9feb0f55fa33e18fbd711ec35426fba"
# commit hashes from compiler/compiler_source.cmake
OPENVINO_COMPILER_COMMIT="3687ccc8dab6a9ad5debfd9263414e6357c43d6f"
NPU_COMPILER_COMMIT="16cb63249167413ea80131472293630e3a1577bb"
NPU_COMPILER_OPENVINO_COMMIT="e4e180d12fa7df6240235926d4ab8084df40e0a1"
# npu_compiler submodule commits
NPU_COST_MODEL_COMMIT="1183a54fcb88c6c2c726b240ed3d1a0459eb5687"
# intel-staging/npu-compiler-llvm is the Intel-patched LLVM 21.1.8 fork that
# npu_compiler's thirdparty/llvm-project submodule pins to; build from source
# to avoid the large set of MLIR API compatibility patches needed for system MLIR
NPU_COMPILER_LLVM_COMMIT="e0a54ec45817ae42a4578b72ade470e20c383ce5"

DESCRIPTION="Intel® NPU (Neural Processing Unit) Driver"
HOMEPAGE="https://github.com/intel/linux-npu-driver"
SRC_URI="
	https://github.com/intel/linux-npu-driver/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/openvinotoolkit/npu_compiler_elf/archive/${NPU_COMPILER_ELF_COMMIT}.tar.gz -> npu-compiler-elf-${NPU_COMPILER_ELF_COMMIT}.tar.gz
	compiler? (
		https://github.com/openvinotoolkit/openvino/archive/${OPENVINO_COMPILER_COMMIT}.tar.gz -> openvino-compiler-src-${OPENVINO_COMPILER_COMMIT}.tar.gz
		https://github.com/openvinotoolkit/npu_compiler/archive/${NPU_COMPILER_COMMIT}.tar.gz -> npu-compiler-src-${NPU_COMPILER_COMMIT}.tar.gz
		https://github.com/openvinotoolkit/openvino/archive/${NPU_COMPILER_OPENVINO_COMMIT}.tar.gz -> openvino-npu-compiler-src-${NPU_COMPILER_OPENVINO_COMMIT}.tar.gz
		https://github.com/intel/npu-nn-cost-model/archive/${NPU_COST_MODEL_COMMIT}.tar.gz -> npu-nn-cost-model-${NPU_COST_MODEL_COMMIT}.tar.gz
		https://github.com/intel-staging/npu-compiler-llvm/archive/${NPU_COMPILER_LLVM_COMMIT}.tar.gz -> npu-compiler-llvm-${NPU_COMPILER_LLVM_COMMIT}.tar.gz
	)
"

S="${WORKDIR}"/linux-npu-driver-${PV}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="compiler"

# libopenvino_intel_npu_compiler.so is a CMake MODULE (dlopen-only); SONAME is intentionally absent
QA_SONAME="usr/lib64/libopenvino_intel_npu_compiler.so"

RDEPEND="
	dev-cpp/yaml-cpp
	dev-libs/level-zero-npu-extensions
"

src_prepare() {
	default
	eapply "${FILESDIR}"/system-deps.patch
	eapply "${FILESDIR}"/level-zero-dditable-compat.patch
	if use compiler; then
		eapply "${FILESDIR}"/compiler-offline-system-deps.patch
		local npu_compiler_dir="${WORKDIR}/npu_compiler-${NPU_COMPILER_COMMIT}"
		patch -d "${npu_compiler_dir}" -p1 \
			< "${FILESDIR}"/npu-compiler-disable-tests.patch || die
		patch -d "${npu_compiler_dir}" -p1 \
			< "${FILESDIR}"/npu-compiler-commit-hash-offline.patch || die
		patch -d "${npu_compiler_dir}" -p1 \
			< "${FILESDIR}"/npu-compiler-npureg-tblgen-link-tablegen.patch || die
		patch -d "${npu_compiler_dir}" -p1 \
			< "${FILESDIR}"/npu-compiler-gcc14-warnings.patch || die
		patch -d "${npu_compiler_dir}" -p1 \
			< "${FILESDIR}"/npu-compiler-llvm-instructions-include.patch || die
		patch -d "${npu_compiler_dir}" -p1 \
			< "${FILESDIR}"/npu-compiler-template-id-cdtor.patch || die
		# populate npu_compiler submodules from pre-downloaded archives
		rmdir "${npu_compiler_dir}/thirdparty/elf" && \
			ln -sv "${WORKDIR}/npu_compiler_elf-${NPU_COMPILER_ELF_COMMIT}" \
			"${npu_compiler_dir}/thirdparty/elf" || die
		rmdir "${npu_compiler_dir}/thirdparty/vpucostmodel" && \
			ln -sv "${WORKDIR}/npu-nn-cost-model-${NPU_COST_MODEL_COMMIT}" \
			"${npu_compiler_dir}/thirdparty/vpucostmodel" || die
		rmdir "${npu_compiler_dir}/thirdparty/llvm-project" && \
			ln -sv "${WORKDIR}/npu-compiler-llvm-${NPU_COMPILER_LLVM_COMMIT}" \
			"${npu_compiler_dir}/thirdparty/llvm-project" || die
		patch -d "${WORKDIR}/openvino-${NPU_COMPILER_OPENVINO_COMMIT}" -p1 \
			< "${FILESDIR}"/openvino-flatbuffers.patch || die
		patch -d "${WORKDIR}/openvino-${NPU_COMPILER_OPENVINO_COMMIT}" -p1 \
			< "${FILESDIR}"/openvino-xbyak-no-system-include.patch || die
	fi
	rmdir third_party/npu_compiler_elf && \
		ln -sv "${WORKDIR}"/npu_compiler_elf-${NPU_COMPILER_ELF_COMMIT} \
		third_party/npu_compiler_elf || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_VALIDATION_BUILD=OFF
	)
	if use compiler; then
		mycmakeargs+=(
			-DENABLE_NPU_COMPILER_BUILD=ON
			"-DOPENVINO_EXTERNAL_SRC=${WORKDIR}/openvino-${OPENVINO_COMPILER_COMMIT}"
			"-DNPU_COMPILER_EXTERNAL_SRC=${WORKDIR}/npu_compiler-${NPU_COMPILER_COMMIT}"
			"-DNPU_COMPILER_OPENVINO_EXTERNAL_SRC=${WORKDIR}/openvino-${NPU_COMPILER_OPENVINO_COMMIT}"
		)
	fi
	cmake_src_configure
}

src_install() {
	cmake_src_install
	if use compiler; then
		rm -rf "${ED}/var" || die
	fi
}
