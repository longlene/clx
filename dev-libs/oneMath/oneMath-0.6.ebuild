# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="oneAPI Math Library"
HOMEPAGE="https://github.com/uxlfoundation/oneMath"
SRC_URI="https://github.com/uxlfoundation/oneMath/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda rocm tbb"

DEPEND="
	llvm-core/dpcpp
	sci-libs/mkl
	virtual/opencl
	tbb? ( dev-cpp/tbb )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	export CC=icx
	export CXX=icpx
	local mycmakeargs=(
		-DENABLE_MKLCPU_THREAD_TBB=$(usex tbb)
		-DBUILD_FUNCTIONAL_TESTS=OFF
		-DBUILD_EXAMPLES=OFF
	)
	cmake_src_configure
}
