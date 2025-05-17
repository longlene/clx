# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake


DESCRIPTION="Unified Memory Framework"
HOMEPAGE="
	https://github.com/oneapi-src/unified-memory-framework
"
SRC_URI="
	https://github.com/oneapi-src/unified-memory-framework/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
#KEYWORDS="~amd64"
IUSE="cuda +hwloc jemalloc l0"

DEPEND="
	dev-cpp/tbb
	cuda? ( dev-util/nvidia-cuda-toolkit )
	hwloc? ( sys-apps/hwloc )
	jemalloc? ( dev-libs/jemalloc )
	l0? ( dev-libs/level-zero )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e "/DESTINATION/{s#doc/\${PROJECT_NAME}#doc/${P}#}" \
		-i CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DUMF_BUILD_SHARED_LIBRARY=ON
		-DUMF_BUILD_LEVEL_ZERO_PROVIDER=$(usex l0)
		-DUMF_LEVEL_ZERO_INCLUDE_DIR="/usr/include/level_zero"
		-DUMF_BUILD_CUDA_PROVIDER=$(usex cuda)
		-DUMF_CUDA_INCLUDE_DIR="/opt/cuda/include"
		-DUMF_BUILD_LIBUMF_POOL_JEMALLOC=$(usex jemalloc)
		-DUMF_BUILD_TESTS=OFF
		-DUMF_BUILD_EXAMPLES=OFF
		-DUMF_DISABLE_HWLOC=$(usex !hwloc)
	)
	cmake_src_configure
}
