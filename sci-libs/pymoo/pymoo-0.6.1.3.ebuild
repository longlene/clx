# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Multi-Objective Optimization in Python"
HOMEPAGE="
	https://pymoo.org
	https://github.com/anyoptimization/pymoo/
"
SRC_URI="https://github.com/anyoptimization/pymoo/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.15[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.1[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3[${PYTHON_USEDEP}]
	>=dev-python/autograd-1.4[${PYTHON_USEDEP}]
	>=dev-python/cma-3.2.2[${PYTHON_USEDEP}]
	dev-python/alive-progress[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/numpy-1.15[${PYTHON_USEDEP}]
	>=dev-python/cython-0.29[${PYTHON_USEDEP}]
"

RESTRICT="test"
