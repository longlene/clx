# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="Plumb a PDF for detailed information about each char, rectangle, and line"
HOMEPAGE="
	https://pypi.org/project/pdfplumber/
	https://github.com/jsvine/pdfplumber/
"
SRC_URI="https://github.com/jsvine/pdfplumber/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=app-text/pdfminer-20251107[${PYTHON_USEDEP}]
	>=dev-python/pillow-9.1[${PYTHON_USEDEP}]
	>=dev-python/pypdfium2-4.18.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
