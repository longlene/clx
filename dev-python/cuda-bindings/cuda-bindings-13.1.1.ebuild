# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PN="cuda-python"
MY_P="${MY_PN}"-${PV}

DESCRIPTION="Python bindings for CUDA"
HOMEPAGE="
	https://pypi.org/project/cuda-bindings/
	https://github.com/NVIDIA/cuda-python/
"
SRC_URI="https://github.com/NVIDIA/cuda-python/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.gh.tar.gz"
S="${WORKDIR}/${MY_P}/cuda_bindings"

LICENSE="NVIDIA-2025"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/cuda-pathfinder[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/cython-3.2[${PYTHON_USEDEP}]
		<dev-python/cython-3.3[${PYTHON_USEDEP}]
		dev-python/pyclibrary[${PYTHON_USEDEP}]
	')
"

export CUDA_HOME="/opt/cuda"
export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_CUDA_BINDINGS="${PV}"
