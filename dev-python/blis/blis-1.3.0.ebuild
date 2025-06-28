# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 pypi

DESCRIPTION="Fast BLAS-like operations from Python and Cython"
HOMEPAGE="
	https://pypi.org/project/blis/
	https://github.com/explosion/cython-blis
"
SRC_URI="
	https://github.com/explosion/cython-blis/archive/refs/tags/release-v${PV}.tar.gz -> cython-${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
BDEPEND="
	>=dev-python/cython-3.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.19.3[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/cython-${PN}-release-v${PV}
