# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/root-project/cling/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

CMAKE_USE_DIR="${WORKDIR}"/llvm
CMAKE_BUILD_TYPE=Release

src_unpack() {
	default
	EGIT_BRANCH=cling-patches
	EGIT_REPO_URI="http://root.cern.ch/git/llvm.git" EGIT_CHECKOUT_DIR=${WORKDIR}/llvm git-r3_src_unpack
	EGIT_REPO_URI="http://root.cern.ch/git/clang.git" EGIT_CHECKOUT_DIR=${WORKDIR}/clang git-r3_src_unpack
}

src_prepare() {
	eapply_user
	ln -s "${WORKDIR}"/clang "${WORKDIR}"/llvm/tools/clang
	ln -s "${WORKDIR}"/${P} "${WORKDIR}"/llvm/tools/cling
}

src_configure() {
	local mycmakeargs=(
	-DLLVM_TARGETS_TO_BUILD="host"
	-DLLVM_BUILD_LLVM_DYLIB=OFF
	-DLLVM_ENABLE_RTTI=ON
	-DLLVM_ENABLE_FFI=ON
	-DLLVM_BUILD_DOCS=OFF
	-DLLVM_ENABLE_SPHINX=OFF
	-DLLVM_ENABLE_DOXYGEN=OFF
	-DFFI_INCLUDE_DIR=$(pkg-config --cflags libffi | cut -c3-)
	)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile -C tools/clang
	cmake-utils_src_compile -C tools/cling
}


