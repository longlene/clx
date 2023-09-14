# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="Optimized inference engine for OpenNMT models"
HOMEPAGE="https://github.com/OpenNMT/CTranslate2"
SRC_URI="
	https://github.com/OpenNMT/CTranslate2/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/google/cpu_features/archive/refs/tags/v0.7.0.tar.gz -> cpu_features-0.7.0.tar.gz
	https://github.com/jarro2783/cxxopts/archive/v3.0.0.tar.gz -> cxxopts-3.0.0.tar.gz
	https://github.com/google/ruy/archive/c31af31ad62cc74650b04368cd9369a389d23248.tar.gz -> ruy-c31af31ad62cc74650b04368cd9369a389d23248.tar.gz
	https://github.com/gabime/spdlog/archive/refs/tags/v1.10.0.tar.gz -> spdlog-1.10.0.tar.gz
	cuda? (
		https://github.com/NVIDIA/cub/archive/1.16.0.tar.gz -> cub-1.16.0.tar.gz
		https://github.com/NVIDIA/thrust/archive/1.16.0.tar.gz -> thrust-1.16.0.tar.gz
	)
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
	rmdir third_party/cpu_features && ln -sv ${WORKDIR}/cpu_features-0.7.0 third_party/cpu_features
	rmdir third_party/cxxopts && ln -sv ${WORKDIR}/cxxopts-3.0.0 third_party/cxxopts
	rmdir third_party/ruy && ln -sv ${WORKDIR}/ruy-c31af31ad62cc74650b04368cd9369a389d23248 third_party/ruy
	rmdir third_party/spdlog && ln -sv ${WORKDIR}/spdlog-1.10.0 third_party/spdlog
	if use cuda ; then
		rmdir third_party/cub && ln -sv ${WORKDIR}/cub-1.16.0 third_party/cub
		rmdir third_party/thrust && ln -sv ${WORKDIR}/thrust-1.16.0 third_party/thrust
	fi
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DWITH_MKL=$(usex mkl)
		-DWITH_CUDA=$(usex cuda)
		-DWITH_OPENBLAS=$(usex blas)
		-DOPENMP_RUNTIME=NONE
	)
	cmake_src_configure
}

