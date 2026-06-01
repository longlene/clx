# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )

inherit cmake python-single-r1

LLVM_COMMIT="13c00cbc2aa2ddc9aae2e72b02bc6cb2a482e0e7"

DESCRIPTION="MLIR-based tile abstraction library for CUDA"
HOMEPAGE="https://github.com/NVIDIA/cuda-tile"
SRC_URI="
	https://github.com/NVIDIA/cuda-tile/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/llvm/llvm-project/archive/${LLVM_COMMIT}.tar.gz -> llvm-${LLVM_COMMIT}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="python"
RESTRICT="test"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

DEPEND="python? ( ${PYTHON_DEPS} )"
RDEPEND="${DEPEND}"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_prepare() {
	# IncludeLLVM.cmake hardcodes lib/cmake paths; patch to respect LLVM_LIBDIR_SUFFIX
	sed -i \
		-e 's|/lib/cmake/llvm|/lib${LLVM_LIBDIR_SUFFIX}/cmake/llvm|g' \
		-e 's|/lib/cmake/mlir|/lib${LLVM_LIBDIR_SUFFIX}/cmake/mlir|g' \
		cmake/IncludeLLVM.cmake || die
	cmake_src_prepare
}

src_configure() {
	local libdir="$(get_libdir)"
	local mycmakeargs=(
		-DCUDA_TILE_USE_LLVM_SOURCE_DIR="${WORKDIR}/llvm-project-${LLVM_COMMIT}"
		# AddLLVM.cmake uses lib${LLVM_LIBDIR_SUFFIX} not CMAKE_INSTALL_LIBDIR
		-DLLVM_LIBDIR_SUFFIX="${libdir#lib}"
		-DCUDA_TILE_ENABLE_BINDINGS_PYTHON=$(usex python ON OFF)
		-DMLIR_ENABLE_BINDINGS_PYTHON=$(usex python ON OFF)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install

	# cmake installs Python package to non-standard /usr/python_packages;
	# move to the correct site-packages location and byte-compile
	if use python && [[ -d "${ED}/usr/python_packages" ]]; then
		local sitedir="${ED}$(python_get_sitedir)"
		mkdir -p "${sitedir}"
		mv "${ED}"/usr/python_packages/* "${sitedir}/" || die
		rmdir "${ED}"/usr/python_packages || die
		python_optimize "${sitedir}"
	fi
}
