# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LLVM_COMMIT="fd3db4ac62588a4fc8cea5d6cbe4d9e50de67ef5"

inherit cmake

DESCRIPTION="The cling C++ interpreter"
HOMEPAGE="https://github.com/root-project/cling"
SRC_URI="
	https://github.com/vgvassilev/cling/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/root-project/llvm-project/archive/${LLVM_COMMIT}.tar.gz -> llvm-${LLVM_COMMIT}.tar.gz
"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

CMAKE_USE_DIR="${WORKDIR}"/llvm-project-${LLVM_COMMIT}/llvm
CMAKE_BUILD_TYPE=Release
#CMAKE_MAKEFILE_GENERATOR=emake

#src_prepare() {
#	default
#	#ln -sv "${WORKDIR}"/clang-${CLANG_COMMIT} "${WORKDIR}"/llvm-project-${LLVM_COMMIT}/tools/clang
#	#ln -sv "${WORKDIR}"/cling-${PV} "${WORKDIR}"/llvm-project-${LLVM_COMMIT}/tools/cling
#	sed -e '/add_subdirectory/{/demo/d}' \
#		-i tools/CMakeLists.txt
#	cmake_src_prepare
#}

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
		-DLLVM_EXTERNAL_PROJECTS=cling
		-DLLVM_EXTERNAL_CLING_SOURCE_DIR=${S}
		-DLLVM_ENABLE_PROJECTS="clang"
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	dosym ../lib/cling/bin/cling /usr/bin/cling
}
