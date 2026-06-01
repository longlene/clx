# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14}  )

inherit distutils-r1

DESCRIPTION="CMA-ES, Covariance Matrix Adaptation Evolution Strategy for non-linear"
HOMEPAGE="
	https://github.com/CMA-ES/pycma
	https://pypi.org/project/cma/
"
SRC_URI="https://github.com/CMA-ES/pycma/archive/refs/tags/r${PV}.tar.gz -> pycma-${PV}.gh.tar.gz"

LICENSE="BSD-3"
SLOT="0"
S="${WORKDIR}"/pycma-r${PV}
KEYWORDS="~amd64"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"
