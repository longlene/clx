# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Google Cloud Spanner API client library"
HOMEPAGE="
	https://pypi.org/project/google-cloud-spanner/
	https://github.com/googleapis/python-spanner
"
SRC_URI="https://github.com/googleapis/python-spanner/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/google-api-core-1.34.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-core-1.4.4[${PYTHON_USEDEP}]
	>=dev-python/grpc-google-iam-v1-0.12.4[${PYTHON_USEDEP}]
	>=dev-python/proto-plus-1.22.0[${PYTHON_USEDEP}]
	>=dev-python/sqlparse-0.4.4[${PYTHON_USEDEP}]
	>=dev-python/proto-plus-1.22.2[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.20.2[${PYTHON_USEDEP}]
	>=dev-python/grpc-interceptor-0.15.4[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.22.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-sdk-1.22.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-semantic-conventions-0.43[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-resourcedetector-gcp-1.8.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-monitoring-2.16.0[${PYTHON_USEDEP}]
	>=dev-python/mmh3-4.1.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/python-spanner-${PV}
