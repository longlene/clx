# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="oneAPI DPC++ Library"
HOMEPAGE="https://github.com/oneapi-src/oneDPL"
SRC_URI="https://github.com/oneapi-src/oneDPL/archive/refs/tags/${P}-release.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	llvm-core/dpcpp
	dev-libs/tbb
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${P}-release

export CC=icx
export CXX=icpx

src_prepare() {
	default
	sed -e '/install/{/set(OUTPUT_DIR/d}' \
		-i CMakeLists.txt
	cmake_src_prepare
}
