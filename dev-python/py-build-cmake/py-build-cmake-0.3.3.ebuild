# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Modern, PEP 517 compliant build backend for creating Python packages with extensions built using CMake"
HOMEPAGE="
	https://github.com/tttapa/py-build-cmake
	https://pypi.org/project/py-build-cmake/
"
SRC_URI="https://github.com/tttapa/py-build-cmake/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/distlib-0.3.5[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.2[${PYTHON_USEDEP}]
	>=dev-python/pyproject-metadata-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/lark-1.1.9[${PYTHON_USEDEP}]
	>=dev-python/click-8.1.3[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/distlib-0.3.5[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.2[${PYTHON_USEDEP}]
	>=dev-python/pyproject-metadata-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/lark-1.1.9[${PYTHON_USEDEP}]
	test? (
		>=dev-python/nox-2023.4.22[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.1.2[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
