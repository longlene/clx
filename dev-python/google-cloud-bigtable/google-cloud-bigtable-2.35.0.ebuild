# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Google Cloud Bigtable API client library"
HOMEPAGE="
	https://pypi.org/project/google-cloud-bigtable/
	https://github.com/googleapis/python-bigtable
"
SRC_URI="https://github.com/googleapis/python-bigtable/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/google-api-core-2.17.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-core-1.4.4[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.23.0[${PYTHON_USEDEP}]
	>=dev-python/grpc-google-iam-v1-0.12.4[${PYTHON_USEDEP}]
	>=dev-python/proto-plus-1.25.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.20.2[${PYTHON_USEDEP}]
	>=dev-python/google-crc32c-1.5.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/python-bigtable-${PV}
