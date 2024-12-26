# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Python package to access a cacophony of neuro-imaging file formats"
HOMEPAGE="
	http://nipy.org/nibabel/
	https://pypi.org/project/nibabel/
"
SRC_URI="https://github.com/nipy/nibabel/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.22[${PYTHON_USEDEP}]
	>=dev-python/packaging-20[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.6[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-httpserver[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
