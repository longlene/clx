# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Adaptive web scraping framework, undetectable and high-performance"
HOMEPAGE="https://github.com/D4Vinci/Scrapling https://scrapling.readthedocs.io/en/latest/"
SRC_URI="https://github.com/D4Vinci/Scrapling/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/Scrapling-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="ai fetchers shell"

REQUIRED_USE="
	ai? ( fetchers )
	shell? ( fetchers )
"

RDEPEND="
	>=dev-python/cssselect-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/lxml-6.1.1[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.11.8[${PYTHON_USEDEP}]
	>=dev-python/tld-0.13.2[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4[${PYTHON_USEDEP}]
	>=dev-python/w3lib-2.4.1[${PYTHON_USEDEP}]
	fetchers? (
		>=dev-python/anyio-4.13.0[${PYTHON_USEDEP}]
		>=dev-python/apify-fingerprint-datapoints-0.13.0[${PYTHON_USEDEP}]
		>=dev-python/browserforge-1.2.4[${PYTHON_USEDEP}]
		>=dev-python/click-8.3.0[${PYTHON_USEDEP}]
		>=dev-python/curl-cffi-0.15.0[${PYTHON_USEDEP}]
		>=dev-python/msgspec-0.21.1[${PYTHON_USEDEP}]
		dev-python/patchright[${PYTHON_USEDEP}]
		dev-python/playwright[${PYTHON_USEDEP}]
		>=dev-python/protego-0.6.0[${PYTHON_USEDEP}]
	)
	ai? (
		>=dev-python/markdownify-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/mcp-1.27.0[${PYTHON_USEDEP}]
	)
	shell? (
		>=dev-python/ipython-8.37[${PYTHON_USEDEP}]
		>=dev-python/markdownify-1.2.0[${PYTHON_USEDEP}]
	)
"

RESTRICT="test"
