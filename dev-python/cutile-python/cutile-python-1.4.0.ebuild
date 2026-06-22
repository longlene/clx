# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

XLA_COMMIT="b6f37ab7767f428fd6f993de5e211643d47d4deb"

DESCRIPTION="cuTile programming model for writing parallel kernels for NVIDIA GPUs"
HOMEPAGE="https://github.com/NVIDIA/cutile-python"
SRC_URI="
	https://github.com/NVIDIA/cutile-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/openxla/xla/archive/${XLA_COMMIT}.tar.gz -> xla-b6f37ab7.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

BDEPEND="
	dev-build/cmake
	dev-util/nvidia-cuda-toolkit
	sci-libs/dlpack
"
RDEPEND="
	$(python_gen_cond_dep '
		dev-python/typing-extensions[${PYTHON_USEDEP}]
	')
"

src_prepare() {
	eapply "${FILESDIR}/${P}-allow-warnings.patch"
	eapply "${FILESDIR}/${P}-fix-copy-file.patch"
	echo "${PV}" > src/cuda/tile/VERSION || die
	distutils-r1_src_prepare
}

python_compile() {
	export CUDAToolkit_ROOT="/opt/cuda"
	export CUDA_TILE_CMAKE_DLPACK_PATH="/usr"
	export CUDA_TILE_CMAKE_XLA_PATH="${WORKDIR}/xla-${XLA_COMMIT}"
	distutils-r1_python_compile
}
