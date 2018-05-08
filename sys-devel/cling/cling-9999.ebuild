# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils flag-o-matic git-r3

DESCRIPTION="Interactive C++ interpreter built on the top of LLVM and Clang libraries"
HOMEPAGE="https://root.cern.ch/cling"
#SRC_URI="https://github.com/root-project/cling/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	virtual/libffi
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/llvm
#CMAKE_USE_DIR="${WORKDIR}"/llvm
CMAKE_BUILD_TYPE=Release

src_unpack() {
	#default
	EGIT_REPO_URI="http://root.cern.ch/git/llvm.git" \
	EGIT_BRANCH=cling-patches \
	EGIT_CHECKOUT_DIR=${WORKDIR}/llvm \
	git-r3_src_unpack

	EGIT_REPO_URI="http://root.cern.ch/git/clang.git" \
	EGIT_BRANCH=cling-patches \
	EGIT_CHECKOUT_DIR=${WORKDIR}/llvm/tools/clang \
	git-r3_src_unpack

	EGIT_REPO_URI="https://github.com/root-project/cling.git" \
	EGIT_BRANCH=master \
	EGIT_CHECKOUT_DIR=${WORKDIR}/llvm/tools/cling \
	git-r3_src_unpack
}

#src_prepare() {
#	eapply_user
#	ln -s "${WORKDIR}"/clang "${WORKDIR}"/llvm/tools/clang
#	ln -s "${WORKDIR}"/${P} "${WORKDIR}"/llvm/tools/cling
#}

src_configure() {
	local libdir=$(get_libdir)
	local mycmakeargs=(
	-DCMAKE_INSTALL_PREFIX="${EPREFIX}/usr/lib/cling"
	-DLLVM_LIBDIR_SUFFIX=${libdir#lib}
	-DLLVM_TARGETS_TO_BUILD="host"
	-DLLVM_BUILD_LLVM_DYLIB=OFF
	-DLLVM_ENABLE_RTTI=ON
	-DLLVM_ENABLE_FFI=ON
	-DLLVM_BUILD_DOCS=OFF
	-DLLVM_ENABLE_SPHINX=OFF
	-DLLVM_ENABLE_DOXYGEN=OFF
	-DFFI_INCLUDE_DIR=$($(tc-getPKG_CONFIG) --cflags-only-I libffi | cut -c3-)
	-DFFI_LIBRARY_DIR=$($(tc-getPKG_CONFIG) --libs-only-L libffi | cut -c3-)
	-DOCAMLFIND=NO
	)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile -C tools/clang
	cmake-utils_src_compile -C tools/cling
}

src_install() {
	cmake-utils_src_install -C tools/clang
	cmake-utils_src_install -C tools/cling
	dosym /usr/lib/cling/bin/cling /usr/bin/cling
}

