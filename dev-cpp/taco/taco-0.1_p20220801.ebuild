# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="2b8ece4c230a5f0f0a74bc6f48e28edfb6c1c95e"

DESCRIPTION="The Tensor Algebra Compiler (taco) computes sparse tensor expressions on CPUs and GPUs"
HOMEPAGE="http://tensor-compiler.org/"
SRC_URI="
	https://github.com/tensor-compiler/taco/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	https://github.com/pybind/pybind11/archive/8de7772cc72daca8e947b79b83fea46214931604.tar.gz -> pybind11-8de7772cc72daca8e947b79b83fea46214931604.tar.gz
"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND="MIT"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rmdir python_bindings/pybind11 && ln -sv "${WORKDIR}"/pybind11-8de7772cc72daca8e947b79b83fea46214931604 python_bindings/pybind11
	sed -e '/add_subdirectory/{/test/d}' \
		-i CMakeLists.txt
	sed -e "/DESTINATION/{s#DESTINATION lib#DESTINATION $(get_libdir)#}" \
		-i src/CMakeLists.txt
	cmake_src_prepare
}
