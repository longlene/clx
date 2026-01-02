# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

MY_PN="cuda-python"
MY_P="${MY_PN}"-${PV}

DESCRIPTION="Python bindings for CUDA"
HOMEPAGE="
	https://pypi.org/project/cuda-bindings/
	https://github.com/NVIDIA/cuda-python/
"
SRC_URI="https://github.com/NVIDIA/cuda-python/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.gh.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-util/nvidia-cuda-toolkit
	dev-python/pyclibrary[${PYTHON_USEDEP}]
"
RDEPEND="
	dev-python/cuda-pathfinder[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/${MY_P}/cuda_bindings

export CUDA_HOME="/opt/cuda"
