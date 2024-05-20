# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="asyncio support for botocore library using aiohttp"
HOMEPAGE="https://github.com/aio-libs/aiobotocore"
SRC_URI="https://github.com/aio-libs/aiobotocore/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/botocore-1.34.70[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.9.2[${PYTHON_USEDEP}]
	>=dev-python/wrapt-1.10.10[${PYTHON_USEDEP}]
	>=dev-python/aioitertools-0.5.1[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest
