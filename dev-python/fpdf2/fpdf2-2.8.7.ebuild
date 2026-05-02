# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Simple PDF generation for Python"
HOMEPAGE="
	https://pypi.org/project/fpdf2/
	https://github.com/py-pdf/fpdf2
"
SRC_URI="https://github.com/py-pdf/fpdf2/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="LGPL-3.0+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/defusedxml[${PYTHON_USEDEP}]
	>=dev-python/pillow-8.0.0[${PYTHON_USEDEP}]
	>=dev-python/fonttools-4.34.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
