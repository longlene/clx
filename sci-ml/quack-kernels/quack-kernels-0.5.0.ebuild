# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A Quirky Assortment of CuTe Kernels"
HOMEPAGE="
	https://pypi.org/project/quack-kernels/
	https://github.com/Dao-AILab/quack
"
SRC_URI="https://github.com/Dao-AILab/quack/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}"/quack-${PV}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/nvidia-cutlass-dsl-4.5.2[${PYTHON_USEDEP}]
		>=sci-ml/tvm-ffi-0.1.6[${PYTHON_USEDEP}]
		sci-ml/torch-c-dlpack-ext[${PYTHON_USEDEP}]
		dev-python/einops[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
