# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="d17a809ef0af09b16625e991a76f6fe80d9c332e"

DESCRIPTION="Port of Facebook's LLaMA model in C/C++"
HOMEPAGE="https://github.com/ggml-org/llama.cpp"
SRC_URI="
	https://github.com/ggml-org/llama.cpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="blas cuda kompute mkl -opencl openmp rocm sycl vulkan ssl test"

DEPEND="
	net-misc/curl
	sci-ml/ggml[blas?,cuda?,kompute?,mkl?,opencl?,openmp?,rocm?,vulkan?]
	ssl? ( dev-libs/openssl )
"
RDEPEND="${DEPEND}"
BEPEND=""

src_configure() {
	if use sycl ; then
		export CC=icx
		export CXX=icpx
		filter-flags '-mabm'
		filter-flags '--param=l1-cache-*'
		filter-flags '--param=l2-cache-*'
	fi
	local mycmakeargs=(
		-DLLAMA_USE_SYSTEM_GGML=ON
		-DLLAMA_BUILD_TESTS=OFF
		-DLLAMA_CURL=ON
		-DLLAMA_SERVER_SSL=$(usex ssl)
		-DLLAMA_BUILD_TESTS=$(usex test)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	newinitd "${FILESDIR}"/llama-server.initd llama-server
	newconfd "${FILESDIR}"/llama-server.confd llama-server
}
