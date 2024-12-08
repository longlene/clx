# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Nearest Neighbor Descent"
HOMEPAGE="
	https://github.com/lmcinnes/pynndescent
	https://pypi.org/project/pynndescent/
"
SRC_URI="https://github.com/lmcinnes/pynndescent/archive/refs/tags/release-${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/scikit-learn-0.18[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.0[${PYTHON_USEDEP}]
	>=dev-python/numba-0.51.2[${PYTHON_USEDEP}]
	>=dev-python/llvmlite-0.30[${PYTHON_USEDEP}]
	>=dev-python/joblib-0.11[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-release-${PV}
