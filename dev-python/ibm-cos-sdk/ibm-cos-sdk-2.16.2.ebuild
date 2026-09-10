# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="IBM SDK for Python (IBM Cloud Object Storage)"
HOMEPAGE="https://github.com/ibm/ibm-cos-sdk-python"
SRC_URI="https://github.com/ibm/ibm-cos-sdk-python/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/ibm-cos-sdk-python-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	~dev-python/ibm-cos-sdk-core-2.16.2[${PYTHON_USEDEP}]
	~dev-python/ibm-cos-sdk-s3transfer-2.16.2[${PYTHON_USEDEP}]
	>=dev-python/jmespath-0.10.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
