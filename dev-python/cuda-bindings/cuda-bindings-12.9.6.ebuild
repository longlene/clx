# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

MY_PN="cuda-python"
MY_P="${MY_PN}"-${PV}

DESCRIPTION="Python bindings for CUDA"
HOMEPAGE="
	https://pypi.org/project/cuda-bindings/
	https://github.com/NVIDIA/cuda-python/
"
SRC_URI="https://github.com/NVIDIA/cuda-python/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="NVIDIA"
SLOT="0"
S="${WORKDIR}"/${MY_P}/cuda_bindings
KEYWORDS="~amd64"

DEPEND+="
	dev-python/cuda-pathfinder[${PYTHON_USEDEP}]
"

BDEPEND="
	dev-python/pyclibrary[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

export CUDA_HOME="/opt/cuda"
export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_CUDA_BINDINGS="${PV}"
