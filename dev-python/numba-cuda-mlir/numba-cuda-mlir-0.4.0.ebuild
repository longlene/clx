# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="CUDA MLIR Python Compiler based on Numba-CUDA"
HOMEPAGE="
	https://nvidia.github.io/numba-cuda-mlir/
	https://github.com/NVIDIA/numba-cuda-mlir
"
SRC_URI="https://github.com/NVIDIA/numba-cuda-mlir/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/cuda-bindings-12.9.1[${PYTHON_USEDEP}]
	>=dev-python/cuda-core-0.5.1[${PYTHON_USEDEP}]
"
DEPEND="
	sci-libs/dlpack
"
BDEPEND="
	dev-build/cmake
	dev-build/ninja
"

PATCHES=(
	"${FILESDIR}/system-dlpack.patch"
)

src_prepare() {
	distutils-r1_src_prepare
}

python_compile() {
	DLPACK_PATH=/usr distutils-r1_python_compile
}

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
