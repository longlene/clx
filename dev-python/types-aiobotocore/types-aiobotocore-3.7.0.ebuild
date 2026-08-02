# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Type annotations for aiobotocore generated with mypy-boto3-builder"
HOMEPAGE="https://github.com/youtype/mypy_boto3_builder https://pypi.org/project/types-aiobotocore/"

S="${WORKDIR}/types_aiobotocore-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="aiobotocore"

RDEPEND="
	dev-python/botocore-stubs[${PYTHON_USEDEP}]
	aiobotocore? ( dev-python/aiobotocore[${PYTHON_USEDEP}] )
"
