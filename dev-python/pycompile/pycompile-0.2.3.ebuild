# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A CLI tool for compiling python"
HOMEPAGE="
	https://pypi.org/project/pycompile/
	https://github.com/iplitharas/pycompile
"
SRC_URI="https://github.com/iplitharas/pycompile/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/cython-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/nuitka-1.7.5[${PYTHON_USEDEP}]
	>=dev-python/click-8.1.3[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.64.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-benchmark-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/memoroy-profiler-0.61.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
