# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION=""
HOMEPAGE="https://github.com/bytecodealliance/wasmtime-cpp"
SRC_URI="https://github.com/bytecodealliance/wasmtime-cpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/add_subdirectory/{/examples/d}' \
		-e '/add_subdirectory/{/tests/d}' \
		-i CMakeLists.txt
	cmake_src_prepare
}
