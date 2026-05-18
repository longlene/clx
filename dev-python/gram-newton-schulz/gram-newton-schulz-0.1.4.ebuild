# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Fast Newton-Schulz Algorithm with Kernels"
HOMEPAGE="
	https://pypi.org/project/gram-newton-schulz/
	https://github.com/Dao-AILab/gram-newton-schulz
"
SRC_URI="https://github.com/Dao-AILab/gram-newton-schulz/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-2.7.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/quack-kernels-0.4.1[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/nvidia-cutlass-dsl-4.4.2[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
