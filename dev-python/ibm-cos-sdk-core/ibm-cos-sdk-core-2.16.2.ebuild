# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Core library for the IBM COS SDK for Python"
HOMEPAGE="https://github.com/ibm/ibm-cos-sdk-python-core"
SRC_URI="https://github.com/ibm/ibm-cos-sdk-python-core/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/ibm-cos-sdk-python-core-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/jmespath-0.10.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.33.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-2.6.2[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
