# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

ONNX_COMMIT="be2b5fde82d9c8874f3d19328bdfe3b6962dc67b"
PYBIND11_COMMIT="3e9dfa2866941655c56877882565e7577de6fc7b"
RCHECK_COMMIT="ff6af6fc683159deb51c543b065eba14dfcf329b"
BENCHMARK_COMMIT="a4cf155615c63e019ae549e31703bf367df5b471"

DESCRIPTION="Lowering of ONNX models in MLIR Compiler Infrastructure"
HOMEPAGE="https://github.com/onnx/onnx-mlir"
SRC_URI="
	https://github.com/onnx/onnx-mlir/archive/refs/tags/v.${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/onnx/onnx/archive/${ONNX_COMMIT}.tar.gz -> ${PN}-onnx-${ONNX_COMMIT}.tar.gz
	https://github.com/pybind/pybind11/archive/${PYBIND11_COMMIT}.tar.gz -> ${PN}-pybind11-${PYBIND11_COMMIT}.tar.gz
	https://github.com/emil-e/rapidcheck/archive/${RCHECK_COMMIT}.tar.gz -> ${PN}-rapidcheck-${RCHECK_COMMIT}.tar.gz
	https://github.com/google/benchmark/archive/${BENCHMARK_COMMIT}.tar.gz -> ${PN}-benchmark-${BENCHMARK_COMMIT}.tar.gz
"

S="${WORKDIR}/onnx-mlir-v.${PV}"

LICENSE="Apache-2.0 BSD BSD-2"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

DEPEND="
	dev-libs/protobuf:=
	llvm-core/mlir:22=
"
RDEPEND="${DEPEND}"
BDEPEND="
	llvm-core/llvm:22
"

src_prepare() {
	rmdir third_party/onnx && \
		ln -sv "${WORKDIR}/onnx-${ONNX_COMMIT}" third_party/onnx || die
	rmdir third_party/pybind11 && \
		ln -sv "${WORKDIR}/pybind11-${PYBIND11_COMMIT}" third_party/pybind11 || die
	rmdir third_party/rapidcheck && \
		ln -sv "${WORKDIR}/rapidcheck-${RCHECK_COMMIT}" third_party/rapidcheck || die
	rmdir third_party/benchmark && \
		ln -sv "${WORKDIR}/benchmark-${BENCHMARK_COMMIT}" third_party/benchmark || die
	cp "${FILESDIR}"/gentoo-mlir-shims.cmake . || die
	eapply "${FILESDIR}"/onnx-mlir-gentoo-mlir-shims.patch
	eapply "${FILESDIR}"/onnx-mlir-omp-num-threads-renamed.patch
	eapply "${FILESDIR}"/onnx-mlir-symbol-table-template-id-cdtor.patch
	eapply "${FILESDIR}"/onnx-mlir-llvm22-no-targetparser.patch
	# onnx-mlir forces CMAKE_INSTALL_LIBDIR=lib globally; patch Python extension
	# MODULE install destinations to the multilib-correct directory directly
	sed -i "s|  DESTINATION lib$|  DESTINATION $(get_libdir)|" \
		src/Runtime/python/CMakeLists.txt || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DMLIR_DIR="${ESYSROOT}/usr/lib/llvm/22/lib64/cmake/mlir"
		-DONNX_MLIR_ENABLE_STABLEHLO=OFF
		-DONNX_MLIR_ENABLE_JAVA=OFF
		-DONNX_MLIR_BUILD_TESTS=OFF
		-DONNX_MLIR_CCACHE_BUILD=OFF
		-DONNX_MLIR_ENABLE_WERROR=OFF
	)
	cmake_src_configure
}
