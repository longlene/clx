# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 python3_14 )

inherit distutils-r1 pypi

DESCRIPTION="IBM watsonx.ai API client"
HOMEPAGE="https://pypi.org/project/ibm-watsonx-ai/ https://ibm.github.io/watsonx-ai-python-sdk"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.27[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.3.3[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
	dev-python/lomond[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/ibm-cos-sdk-2.12.0[${PYTHON_USEDEP}]
	dev-python/cachetools[${PYTHON_USEDEP}]
"
