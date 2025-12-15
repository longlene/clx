# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

EGIT_COMMIT="a34425241fe7da1be6d400b98b9504a32327feac"

DESCRIPTION="Unified Memory Framework"
HOMEPAGE="
	https://github.com/oneapi-src/unified-memory-framework
"
SRC_URI="
	https://github.com/oneapi-src/unified-memory-framework/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda jemalloc l0"

DEPEND="
	dev-cpp/tbb
	sys-apps/hwloc
	cuda? ( dev-util/nvidia-cuda-toolkit )
	jemalloc? ( dev-libs/jemalloc )
	l0? ( dev-libs/level-zero )
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

src_prepare() {
	default
	echo "$(ver_cut 1-3)-0-${EGIT_COMMIT}" > VERSION
	sed -e "/DESTINATION/{s#doc/\${PROJECT_NAME}#doc/${P}#}" \
		-i CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DUMF_VERSION="${PV}"
		-DUMF_BUILD_SHARED_LIBRARY=ON
		-DUMF_BUILD_LEVEL_ZERO_PROVIDER=$(usex l0)
		-DUMF_LEVEL_ZERO_INCLUDE_DIR="/usr/include/level_zero"
		-DUMF_BUILD_CUDA_PROVIDER=$(usex cuda)
		-DUMF_CUDA_INCLUDE_DIR="/opt/cuda/include"
		-DUMF_BUILD_LIBUMF_POOL_JEMALLOC=$(usex jemalloc)
		-DUMF_BUILD_TESTS=OFF
		-DUMF_BUILD_EXAMPLES=OFF
	)
	cmake_src_configure
}
