# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="The cling C++ interpreter"
HOMEPAGE="https://github.com/root-project/cling"
SRC_URI="
	https://github.com/root-project/cling/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/vgvassilev/llvm/archive/85e4285.tar.gz -> llvm-85e4285.tar.gz
	https://github.com/vgvassilev/clang/archive/b7fa7dc.tar.gz -> clang-b7fa7dc.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

CMAKE_USE_DIR="${WORKDIR}"/llvm
CMAKE_BUILD_TYPE=Release

src_prepare() {
	default
	mv "${WORKDIR}"/llvm-85e42859fb6de405e303fc8d92e37ff2b652b4b5 "${WORKDIR}"/llvm
	ln -sv "${WORKDIR}"/clang-b7fa7dcfd21cac3d67688be9bdc83a35778e53e1 "${WORKDIR}"/llvm/tools/clang
	ln -sv "${WORKDIR}"/${P} "${WORKDIR}"/llvm/tools/cling
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
	-DCMAKE_INSTALL_PREFIX=/usr/lib/cling
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

src_compile() {
	cmake_src_compile -C tools/clang
	cmake_src_compile -C tools/cling
}

src_install() {
	cmake_src_install
	dosym /usr/lib/cling/bin/cling /usr/bin/cling
}
