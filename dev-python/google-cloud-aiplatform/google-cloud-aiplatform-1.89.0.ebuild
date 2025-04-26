# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A Python SDK for Vertex AI, a fully managed, end-to-end platform for data science and machine learning"
HOMEPAGE="
	https://pypi.org/project/google-cloud-aiplatform/
	https://github.com/googleapis/python-aiplatform
"
SRC_URI="https://github.com/googleapis/python-aiplatform/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/google-api-core-1.34.1[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.14.1[${PYTHON_USEDEP}]
	>=dev-python/proto-plus-1.22.3[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.20.2[${PYTHON_USEDEP}]
	>=dev-python/packaging-14.3[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-storage-1.32.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-bigquery-1.15.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-resource-manager-1.3.3[${PYTHON_USEDEP}]
	dev-python/hapely[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/python-aiplatform-${PV}
