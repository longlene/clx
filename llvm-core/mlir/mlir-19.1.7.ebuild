# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
LLVM_SLOT=${PV%%.*}

inherit flag-o-matic cmake-multilib linux-info llvm llvm.org
inherit python-any-r1 toolchain-funcs

DESCRIPTION="Multi Level Intermediate Representation for LLVM"
HOMEPAGE="https://mlir.llvm.org"

LICENSE="Apache-2.0-with-LLVM-exceptions"
SLOT="${LLVM_MAJOR}/${LLVM_SOABI}"
KEYWORDS="~amd64"
IUSE="cuda debug test"
#REQUIRED_USE=""
DEPEND="
	llvm-core/llvm:${SLOT}
"
RDEPEND="
	${DEPEND}
"
BDEPEND="
	${PYTHON_DEPS}
	llvm-core/llvm:${SLOT}
"
RESTRICT="
"
LLVM_COMPONENTS=( mlir cmake )
llvm.org_set_globals

python_check_deps() {
	if use test; then
		python_has_version "dev-python/lit[${PYTHON_USEDEP}]"
	fi
}

pkg_setup() {
	python-any-r1_pkg_setup
	LLVM_MAX_SLOT="${LLVM_SLOT}"
	llvm_pkg_setup
}

src_prepare() {
	cmake_src_prepare
}

multilib_src_configure() {
	# LTO causes issues in other packages building, #870127
	filter-lto

	# LLVM_ENABLE_ASSERTIONS=NO does not guarantee this for us, #614844
	use debug || local -x CPPFLAGS="${CPPFLAGS} -DNDEBUG"

	local libdir="$(get_libdir)"
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="${EPREFIX}/usr/lib/llvm/${LLVM_MAJOR}"
		-DLLVM_BUILD_TOOLS=ON
		-DLLVM_BUILD_UTILS=ON
		#-DLLVM_INSTALL_UTILS=ON
		-DLLVM_LINK_LLVM_DYLIB=ON
		-DMLIR_LINK_MLIR_DYLIB=ON
		-DMLIR_INCLUDE_TESTS=OFF
		-DMLIR_INCLUDE_INTEGRATION_TESTS=OFF
		-DMLIR_ENABLE_CUDA_RUNNER=$(usex cuda)
	)

	cmake_src_configure
}

multilib_src_test() {
	# respect TMPDIR!
	local -x LIT_PRESERVES_TMP=1

	cmake_build check-mlir
}

multilib_src_install() {
	cmake_src_install
	sed -e "s|\"mlir-tblgen\"|\"/usr/lib/llvm/${LLVM_MAJOR}/bin/mlir-tblgen\"|g" \
		-i "${ED}/usr/lib/llvm/${LLVM_MAJOR}/$(get_libdir)/cmake/mlir/MLIRConfig.cmake" \
		|| die
}
