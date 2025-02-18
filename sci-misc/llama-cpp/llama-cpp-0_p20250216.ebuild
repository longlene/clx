# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="6dde1782483d6b0a1d59f5a5fbcb3119b9d34c27"

DESCRIPTION="Port of Facebook's LLaMA model in C/C++"
HOMEPAGE="https://github.com/ggerganov/llama.cpp"
SRC_URI="
	https://github.com/ggerganov/llama.cpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="blas cuda kompute mkl opencl openmp rocm sycl vulkan test"

DEPEND="
	net-misc/curl
	sci-libs/ggml[blas?,cuda?,kompute?,mkl?,opencl?,openmp?,rocm?,vulkan?]
"
RDEPEND="${DEPEND}"
BEPEND=""

src_prepare() {
	default
	eapply \
		"${FILESDIR}"/system-mkl.patch \
		"${FILESDIR}"/system-ggml.patch
	cmake_src_prepare
}

src_configure() {
	if use sycl ; then
		export CC=icx
		export CXX=icpx
		filter-flags '-mabm'
		filter-flags '--param=l1-cache-*'
		filter-flags '--param=l2-cache-*'
	fi
	local mycmakeargs=(
		-DLLAMA_BUILD_TESTS=OFF
		-DLLAMA_CURL=ON
		-DLLAMA_BUILD_TESTS=$(usex test)
	)
	cmake_src_configure
}
