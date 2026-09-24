# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

NPU_COMPILER_ELF_COMMIT="d325f45f2cb405b5fa2ff17a30de9469f1641b73"
# commit hashes from compiler/compiler_source.cmake
OPENVINO_COMPILER_COMMIT="759c5a6ab8c066af5f4bc5ebd04643706012a37d"
NPU_COMPILER_COMMIT="0b38f7d42113ff329ac2bdd33583d123de4ccf2f"
NPU_COMPILER_OPENVINO_COMMIT="d8047fb380b27a9d5827cb3f22aec7781ae5ac82"
# npu_compiler submodule commits
NPU_COST_MODEL_COMMIT="4b5da8484d7a5c8cb097486c1248c4d2a753ae4b"
# intel-staging/npu-compiler-llvm is the Intel-patched LLVM fork that
# npu_compiler's thirdparty/llvm-project submodule pins to; build from source
# to avoid the large set of MLIR API compatibility patches needed for system MLIR
NPU_COMPILER_LLVM_COMMIT="8f3977c01be0f24be98b67ef2c911fd82657f30c"

DESCRIPTION="Intel® NPU (Neural Processing Unit) Driver"
HOMEPAGE="https://github.com/intel/linux-npu-driver"
SRC_URI="
	https://github.com/intel/linux-npu-driver/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/openvinotoolkit/npu_compiler_elf/archive/${NPU_COMPILER_ELF_COMMIT}.tar.gz
		-> npu-compiler-elf-${NPU_COMPILER_ELF_COMMIT}.tar.gz
	compiler? (
		https://github.com/openvinotoolkit/openvino/archive/${OPENVINO_COMPILER_COMMIT}.tar.gz
			-> openvino-compiler-src-${OPENVINO_COMPILER_COMMIT}.tar.gz
		https://github.com/openvinotoolkit/npu_compiler/archive/${NPU_COMPILER_COMMIT}.tar.gz
			-> npu-compiler-src-${NPU_COMPILER_COMMIT}.tar.gz
		https://github.com/openvinotoolkit/openvino/archive/${NPU_COMPILER_OPENVINO_COMMIT}.tar.gz
			-> openvino-npu-compiler-src-${NPU_COMPILER_OPENVINO_COMMIT}.tar.gz
		https://github.com/intel/npu-nn-cost-model/archive/${NPU_COST_MODEL_COMMIT}.tar.gz
			-> npu-nn-cost-model-${NPU_COST_MODEL_COMMIT}.tar.gz
		https://github.com/intel-staging/npu-compiler-llvm/archive/${NPU_COMPILER_LLVM_COMMIT}.tar.gz
			-> npu-compiler-llvm-${NPU_COMPILER_LLVM_COMMIT}.tar.gz
	)
"

S="${WORKDIR}"/linux-npu-driver-${PV}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="compiler"

# libopenvino_intel_npu_compiler.so is a CMake MODULE (dlopen-only); SONAME is intentionally absent
QA_SONAME="usr/lib64/libopenvino_intel_npu_compiler.so"

RDEPEND="
	dev-cpp/yaml-cpp
	dev-libs/level-zero-npu-extensions
"

src_prepare() {
	default
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
		# Upstream's own compiler_source.cmake applies this patch as part of
		# the ExternalProject_Add() PATCH_COMMAND it runs against a live git
		# checkout; since *_EXTERNAL_SRC bypasses that fetch+patch machinery
		# entirely (offline tarball build), apply it ourselves to the tree
		# that actually gets built (NPU_COMPILER_OPENVINO_EXTERNAL_SRC).
		patch -d "${WORKDIR}/openvino-${NPU_COMPILER_OPENVINO_COMMIT}" -p1 \
			< "${S}"/compiler/openvino_patches/0001-Add-level-zero-dependency-on-openvino_npu_vm_utils.patch || die
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
