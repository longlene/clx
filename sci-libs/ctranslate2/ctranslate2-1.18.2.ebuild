# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

DESCRIPTION="Optimized inference engine for OpenNMT models"
HOMEPAGE="https://github.com/OpenNMT/CTranslate2"
SRC_URI="
	https://github.com/OpenNMT/CTranslate2/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/jarro2783/cxxopts/archive/v2.2.1.tar.gz -> cxxopts-2.2.1.tar.gz
	https://github.com/NVIDIA/cub/archive/1.11.0.tar.gz -> cub-1.11.0.tar.gz
	https://github.com/NVIDIA/thrust/archive/1.11.0.tar.gz -> thrust-1.11.0.tar.gz
	https://github.com/google/googletest/archive/release-1.10.0.tar.gz -> googletest-1.10.0.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cuda mkl blas"

DEPEND="
	mkl? ( sci-libs/mkl )
	cuda? ( dev-util/nvidia-cuda-sdk )
	blas? ( sci-libs/openblas )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rmdir third_party/cxxopts
	mv ${WORKDIR}/cxxopts-2.2.1 third_party/cxxopts
	if use cuda ; then
		rmdir third_party/cub
		mv ${WORKDIR}/cub-1.11.0 third_party/cub
		rmdir thrid_party/thrust
		mv ${WORKDIR}/thrust-1.11.0 third_party/thrust
	fi
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DWITH_MKL=$(usex mkl)
		-DWITH_CUDA=$(usex cuda)
		-DWITH_OPENBLAS=$(usex blas)
		-DOPENMP_RUNTIME=NONE
	)
	cmake-utils_src_configure
}

