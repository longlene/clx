# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Pathfinder for CUDA components"
HOMEPAGE="
	https://pypi.org/project/cuda-pathfinder/
	https://github.com/NVIDIA/cuda-python/
"
SRC_URI="https://github.com/NVIDIA/cuda-python/archive/refs/tags/cuda-pathfinder-v${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/cuda-python-cuda-pathfinder-v${PV}/cuda_pathfinder
