# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="Admin interface for aiohttp application"
HOMEPAGE="https://github.com/aio-libs/aiohttp-admin"
SRC_URI="https://github.com/aio-libs/aiohttp-admin/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	=dev-python/aiohttp-3.9.5[${PYTHON_USEDEP}]
	=dev-python/aiohttp-security-0.5.0[${PYTHON_USEDEP}]
	=dev-python/aiohttp-session-2.12.0[${PYTHON_USEDEP}]
	=dev-python/aiosqlite-0.20.0[${PYTHON_USEDEP}]
	=dev-python/cryptography-42.0.5[${PYTHON_USEDEP}]
	=dev-python/pydantic-2.7.0[${PYTHON_USEDEP}]
	=dev-python/sqlalchemy-2.0.29[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-aiohttp-1.0.5[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
