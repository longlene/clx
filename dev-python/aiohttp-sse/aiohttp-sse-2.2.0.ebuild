# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Server-sent events support for aiohttp"
HOMEPAGE="https://github.com/aio-libs/aiohttp-sse"
SRC_URI="https://github.com/aio-libs/aiohttp-sse/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aiohttp-3.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-aiohttp-1.0.5[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.23.6[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
