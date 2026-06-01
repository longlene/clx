# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Pythonic CUDA module"
HOMEPAGE="
	https://pypi.org/project/cuda-core/
	https://github.com/NVIDIA/cuda-python/
"
SRC_URI="https://github.com/NVIDIA/cuda-python/archive/refs/tags/cuda-core-v${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
S="${WORKDIR}"/cuda-python-cuda-core-v${PV}/cuda_core
KEYWORDS="~amd64"

DEPEND+="
	dev-python/cuda-bindings[${PYTHON_USEDEP}]
"
RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/cython-3.2[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

export CUDA_HOME="/opt/cuda"
