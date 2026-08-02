# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="CMake helpers for building Cython modules"
HOMEPAGE="https://github.com/scikit-build/cython-cmake"
SRC_URI="https://github.com/scikit-build/cython-cmake/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		app-alternatives/ninja
		dev-build/cmake
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/scikit-build-core[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=( pytest )

distutils_enable_tests pytest
