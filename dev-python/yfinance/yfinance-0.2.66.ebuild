# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Download market data from Yahoo! Finance's API"
HOMEPAGE="
	https://pypi.org/project/yfinance/
	https://github.com/ranaroussi/yfinance
"
SRC_URI="https://github.com/ranaroussi/yfinance/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pandas-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.16.5[${PYTHON_USEDEP}]
	>=dev-python/requests-2.31[${PYTHON_USEDEP}]
	>=dev-python/multitasking-0.0.7[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pytz-2022.5[${PYTHON_USEDEP}]
	>=dev-python/frozendict-2.3.4[${PYTHON_USEDEP}]
	>=dev-python/peewee-3.16.2[${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup4-4.11.1[${PYTHON_USEDEP}]
	>=dev-python/curl-cffi-0.7[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.19.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-13.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
