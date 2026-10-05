# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C API for MLX"
HOMEPAGE="https://github.com/ml-explore/mlx-c"
SRC_URI="https://github.com/ml-explore/mlx-c/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

IUSE="cuda"
DEPEND="
	sci-ml/mlx
	cuda? ( sci-ml/mlx[cuda] )
"
RDEPEND="${DEPEND}"

src_prepare() {
	cmake_src_prepare
	if ! use cuda; then
		# CUDA API requires the cuda backend headers from sci-ml/mlx[cuda]
		sed -i -e '/cuda.cpp/d' "${S}"/CMakeLists.txt || die
		rm "${S}"/mlx/c/cuda.h || die
	fi
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=ON
		-DMLX_C_BUILD_EXAMPLES=OFF
		-DMLX_C_USE_SYSTEM_MLX=ON
	)
	cmake_src_configure
}
