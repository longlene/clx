# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

COMMIT="da49c0d60f477626a608b22e735957ef3425ee9b"

inherit cuda cmake toolchain-funcs

DESCRIPTION="C++/CUDA inference engine for explicitly registered Qwen checkpoints"
HOMEPAGE="https://github.com/Neroued/ninfer"
SRC_URI="https://github.com/Neroued/ninfer/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/ninfer-${COMMIT}"

# Apache-2.0: ninfer itself. MIT: bundled third_party/{utf8proc,nlohmann,cpp-httplib},
# compiled directly into the binaries.
LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS="~amd64"

# Upstream hardcodes CMAKE_CUDA_ARCHITECTURES=120a and refuses to configure with
# any other value; the build target is a single NVIDIA GeForce RTX 5090.
RDEPEND="
	dev-util/nvidia-cuda-toolkit:=
	media-video/ffmpeg:=
	net-misc/curl
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

src_configure() {
	tc-export CXX CC

	cuda_add_sandbox

	local mycmakeargs=(
		-DCMAKE_CUDA_HOST_COMPILER="$(cuda_gccdir)"
	)
	cmake_src_configure
}

src_install() {
	dobin "${BUILD_DIR}"/apps/ninfer
	dobin "${BUILD_DIR}"/apps/ninfer-serve
	dobin "${BUILD_DIR}"/apps/ninfer-perplexity
}
