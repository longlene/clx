# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A pure-python CLI application to manipulate PDF files"
HOMEPAGE="
	https://pypi.org/project/pdfly/
	https://github.com/py-pdf/pdfly
"
SRC_URI="https://github.com/py-pdf/pdfly/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pypdf-5.1.0[${PYTHON_USEDEP}]
	>=dev-python/typer-0.12.4[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	>=dev-python/fpdf2-2.8.1[${PYTHON_USEDEP}]
	dev-python/asn1crypto[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/endesive[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.5[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
