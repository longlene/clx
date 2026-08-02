# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="The CUDA target for Numba"
HOMEPAGE="
	https://pypi.org/project/numba-cuda/
	https://github.com/NVIDIA/numba-cuda
"
SRC_URI="https://github.com/NVIDIA/numba-cuda/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-python/numba[${PYTHON_USEDEP}]
	dev-python/cuda-bindings[${PYTHON_USEDEP}]
	dev-python/cuda-core[${PYTHON_USEDEP}]
	dev-python/cuda-pathfinder[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
"
