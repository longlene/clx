# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Cryptocurrency trading API for 100+ exchanges"
HOMEPAGE="
	https://github.com/ccxt/ccxt
	https://pypi.org/project/ccxt/
"
SRC_URI="https://github.com/ccxt/ccxt/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/aiohttp-3.10.11[${PYTHON_USEDEP}]
	>=dev-python/aiodns-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/certifi-2018.1.18[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.6.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.18.4[${PYTHON_USEDEP}]
	>=dev-python/setuptools-60.9.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.4.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.7.2[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		~dev-python/coincurve-21.0.0[${PYTHON_USEDEP}]
	' python3_13)
"
BDEPEND="
	>=dev-python/setuptools-60.9.0[${PYTHON_USEDEP}]
"
