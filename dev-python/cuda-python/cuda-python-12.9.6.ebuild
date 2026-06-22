# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="CUDA Python: Performance meets Productivity"
HOMEPAGE="
	https://pypi.org/project/cuda-python/
	https://github.com/NVIDIA/cuda-python/
"
SRC_URI="https://github.com/NVIDIA/cuda-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="NVIDIA"
SLOT="0"
S="${WORKDIR}"/${P}/cuda_python
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/cuda-bindings-${PV}[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
