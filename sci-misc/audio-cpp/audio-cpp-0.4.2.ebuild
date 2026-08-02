# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="High-performance C++ inference framework for audio models, built on ggml"
HOMEPAGE="https://github.com/0xShug0/audio.cpp"
SRC_URI="https://github.com/0xShug0/audio.cpp/archive/refs/tags/release-${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/audio.cpp-release-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda openmp test"
RESTRICT="!test? ( test )"

DEPEND="
	dev-libs/libyaml:=
	sci-ml/sentencepiece:=
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
	cuda? ( dev-util/nvidia-cuda-toolkit )
"

PATCHES=( "${FILESDIR}/${P}-system-deps.patch" )

src_configure() {
	local mycmakeargs=(
		-DENGINE_ENABLE_CUDA=$(usex cuda)
		-DENGINE_ENABLE_OPENMP=$(usex openmp)
		-DENGINE_BUILD_TESTS=$(usex test)
		-DENGINE_BUILD_EXAMPLES=OFF
		-DENGINE_BUILD_WARMBENCH=OFF
	)
	cmake_src_configure
}

src_install() {
	dobin "${BUILD_DIR}/bin/audiocpp_cli"
	dobin "${BUILD_DIR}/bin/audiocpp_server"
	dobin "${BUILD_DIR}/bin/audiocpp_gguf"
	dodoc README.md
}
