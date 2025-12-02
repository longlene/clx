# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Google Cloud Iam API client library"
HOMEPAGE="
	https://pypi.org/project/google-cloud-iam/
	https://github.com/googleapis/google-cloud-python/
"
SRC_URI="https://github.com/googleapis/google-cloud-python/archive/refs/tags/google-cloud-iam-v${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/google-api-core-1.34.1[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.14.1[${PYTHON_USEDEP}]
	>=dev-python/grpc-google-iam-v1-0.12.4[${PYTHON_USEDEP}]
	>=dev-python/grpcio-1.33.2[${PYTHON_USEDEP}]
	>=dev-python/proto-plus-1.25.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.20.2[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/google-cloud-python-google-cloud-iam-v${PV}/packages/${PN}
