# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A collection of modern C++ libraries"
HOMEPAGE="
	https://github.com/alibaba/yalantinglibs
"
SRC_URI="https://github.com/alibaba/yalantinglibs/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda ssl uring"

DEPEND="
	cuda? ( dev-util/nvidia-cuda-toolkit )
	ssl? ( dev-libs/openssl )
	uring? ( sys-libs/liburing )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DYLT_ENABLE_CUDA=$(usex cuda)
		-DYLT_ENABLE_SSL=$(usex ssl)
		-DYLT_ENABLE_IO_URING=$(usex uring)
		-DBUILD_EXAMPLES=OFF
		-DBUILD_UNIT_TESTS=OFF
		-DGENERATE_BENCHMARK_DATA=OFF
		-DBUILD_BENCHMARK=OFF
		-DENABLE_SANITIZER=OFF
		-DINSTALL_THIRDPARTY=OFF
		-DINSTALL_STANDALONE=OFF
	)
	cmake_src_configure
}
