# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Google BigQuery API client library"
HOMEPAGE="
	https://pypi.org/project/google-cloud-bigquery/
	https://github.com/googleapis/python-bigquery
"
SRC_URI="https://github.com/googleapis/python-bigquery/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/google-api-core-2.11.1[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.14.1[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-core-2.4.1[${PYTHON_USEDEP}]
	>=dev-python/google-resumable-media-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-24.2.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.2[${PYTHON_USEDEP}]
	>=dev-python/requests-2.21.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/python-bigquery-${PV}
