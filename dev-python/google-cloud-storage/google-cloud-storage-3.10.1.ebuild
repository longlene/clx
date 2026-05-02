# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Google Cloud Storage API client library"
HOMEPAGE="
	https://pypi.org/project/google-cloud-storage/
	https://github.com/googleapis/python-storage
"
SRC_URI="https://github.com/googleapis/python-storage/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/google-auth-2.26.1[${PYTHON_USEDEP}]
	>=dev-python/google-api-core-2.27.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-core-2.4.2[${PYTHON_USEDEP}]
	>=dev-python/google-resumable-media-2.7.2[${PYTHON_USEDEP}]
	>=dev-python/requests-2.22.0[${PYTHON_USEDEP}]
	>=dev-python/google-crc32c-1.1.3[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/python-storage-${PV}
