# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=scikit-build-core
DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Cython wrapper around llama.cpp, whisper.cpp and stable-diffusion.cpp"
HOMEPAGE="https://github.com/shakfu/cyllama"
SRC_URI="https://github.com/shakfu/cyllama/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
"
DEPEND="
	sci-misc/llama-cpp
	sci-ml/ggml
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${P}-sqlite-vector-avx2-const.patch"
	"${FILESDIR}/${P}-cmake-rpath.patch"
)

python_configure_all() {
	DISTUTILS_ARGS=(
		"-DWITH_DYLIB=ON"
		"-DLLAMACPP_DYLIB_DIR=${ESYSROOT}/usr/$(get_libdir)"
		"-DWITH_WHISPER=OFF"
		"-DWITH_STABLEDIFFUSION=OFF"
	)
}
