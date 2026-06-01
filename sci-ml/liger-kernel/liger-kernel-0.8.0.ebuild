# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Efficient Triton Kernels for LLM Training"
HOMEPAGE="
	https://pypi.org/project/liger-kernel/
	https://github.com/linkedin/Liger-Kernel
"
SRC_URI="https://github.com/linkedin/Liger-Kernel/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-2"
SLOT="0"
S="${WORKDIR}"/Liger-Kernel-${PV}
KEYWORDS="~amd64"

RDEPEND="
	|| (
		dev-python/triton[${PYTHON_SINGLE_USEDEP}]
		dev-python/triton-bin[${PYTHON_SINGLE_USEDEP}]
	)
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
