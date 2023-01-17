# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CLING_COMMIT="da247bd77a92f0793abe95e10b373dbca7a7e5f1"
LLVM_COMMIT="ac712f0f44b45a1455a302dd6cbb7b6cce269d2d"
CLANG_COMMIT="25f804797f80b69d8c56794e3e0300acd9458958"

#inherit cmake flag-o-matic
inherit cmake

DESCRIPTION="The cling C++ interpreter"
HOMEPAGE="https://github.com/root-project/cling"
SRC_URI="
	https://github.com/root-project/cling/archive/${CLING_COMMIT}.tar.gz -> cling-${CLING_COMMIT}.tar.gz
	https://github.com/vgvassilev/llvm/archive/${LLVM_COMMIT}.tar.gz -> llvm-${LLVM_COMMIT}.tar.gz
	https://github.com/vgvassilev/clang/archive/${CLANG_COMMIT}.tar.gz -> clang-${CLANG_COMMIT}.tar.gz
"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/cling-${CLING_COMMIT}
CMAKE_USE_DIR="${WORKDIR}"/llvm-${LLVM_COMMIT}
CMAKE_BUILD_TYPE=Release
#CMAKE_MAKEFILE_GENERATOR=emake

src_prepare() {
	default
	ln -sv "${WORKDIR}"/clang-${CLANG_COMMIT} "${WORKDIR}"/llvm-${LLVM_COMMIT}/tools/clang
	ln -sv "${WORKDIR}"/cling-${CLING_COMMIT} "${WORKDIR}"/llvm-${LLVM_COMMIT}/tools/cling
	sed -e '/add_subdirectory/{/demo/d}' \
		-i tools/CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	#append-cxxflags -DLLVM_ENABLE_ABI_BREAKING_CHECKS=0
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX=/usr/lib/cling
		-DLLVM_ABI_BREAKING_CHECKS=FORCE_ON
		-DLLVM_TARGETS_TO_BUILD="host;NVPTX"
		-DLLVM_BUILD_LLVM_DYLIB=OFF
		-DLLVM_ENABLE_RTTI=ON
		-DLLVM_ENABLE_FFI=ON
		-DLLVM_BUILD_DOCS=OFF
		-DLLVM_BUILD_TOOLS=OFF
		-DLLVM_ENABLE_SPHINX=OFF
		-DLLVM_ENABLE_DOXYGEN=OFF
		-DFFI_INCLUDE_DIR=$(pkg-config --cflags libffi | cut -c3-)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	dosym ../lib/cling/bin/cling /usr/bin/cling
}
