# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PV="release-v${PV}"

DESCRIPTION="Elegant and simple financial data interface library for Python"
HOMEPAGE="https://github.com/akfamily/akshare"
SRC_URI="https://github.com/akfamily/akshare/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/akshare-${MY_PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/beautifulsoup4-4.9.1[${PYTHON_USEDEP}]
	>=dev-python/curl-cffi-0.13.0[${PYTHON_USEDEP}]
	>=dev-python/decorator-4.4.2[${PYTHON_USEDEP}]
	>=dev-python/html5lib-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/jsonpath-0.82[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.2.1[${PYTHON_USEDEP}]
	>=dev-python/openpyxl-3.0.3[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/py-mini-racer-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/akracer-0.0.13[${PYTHON_USEDEP}]
	>=dev-python/requests-2.22.0[${PYTHON_USEDEP}]
	>=dev-python/tabulate-0.8.6[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.43.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.25.8[${PYTHON_USEDEP}]
	>=dev-python/xlrd-1.2.0[${PYTHON_USEDEP}]
"
