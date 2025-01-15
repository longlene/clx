# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_12 )

inherit distutils-r1 pypi

DESCRIPTION="Aliyun OSS (Object Storage Service) SDK"
HOMEPAGE="
    http://oss.aliyun.com
	https://pypi.org/project/oss2/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>dev-python/requests-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/crcmod-1.7[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.4.7[${PYTHON_USEDEP}]
	>=dev-python/aliyun-python-sdk-kms-2.4.1[${PYTHON_USEDEP}]
	>=dev-python/aliyun-python-sdk-core-2.13.12[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
