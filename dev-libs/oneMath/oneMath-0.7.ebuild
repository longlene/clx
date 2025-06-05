# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake flag-o-matic

DESCRIPTION="oneAPI Math Library"
HOMEPAGE="https://github.com/uxlfoundation/oneMath"
SRC_URI="https://github.com/uxlfoundation/oneMath/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda rocm tbb"

DEPEND="
	llvm-core/dpcpp
	sci-libs/mkl[sycl]
	virtual/opencl
	cuda? ( dev-util/nvidia-cuda-toolkit )
	tbb? ( dev-cpp/tbb )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	find . -name 'CMakeLists.txt' -exec sed -e "s#DESTINATION lib#DESTINATION $(get_libdir)#" -i {} \;
	cmake_src_prepare
}

src_configure() {
	export CC=icx
	export CXX=icpx
	filter-flags -mabm --param=l1-cache-* --param=l2-cache-*
	local mycmakeargs=(
		-DENABLE_MKLCPU_THREAD_TBB=$(usex tbb)
		-DENABLE_CUBLAS_BACKEND=$(usex cuda)
		-DENABLE_CURAND_BACKEND=$(usex cuda)
		-DENABLE_CUSOLVER_BACKEND=$(usex cdua)
		-DENABLE_CUFFT_BACKEND=$(usex cuda)
		-DENABLE_CUSPARSE_BACKEND=$(usex cuda)
		-DBUILD_FUNCTIONAL_TESTS=OFF
		-DBUILD_EXAMPLES=OFF
	)
	cmake_src_configure
}
