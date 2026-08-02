# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Python bindings for NCCL"
HOMEPAGE="
	https://pypi.org/project/nccl4py/
	https://github.com/NVIDIA/nccl/
"
SRC_URI="https://github.com/NVIDIA/nccl/archive/refs/tags/nccl4py-v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}"/nccl-nccl4py-v${PV}/bindings/nccl4py/

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/cuda-core-1.0[${PYTHON_USEDEP}]
	>=dev-python/cuda-pathfinder-1.5.4[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/cython-3.1[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

export CUDA_HOME="/opt/cuda"
