# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="A Python Matrix client library, designed according to sans I/O"
HOMEPAGE="https://github.com/poljar/matrix-nio"
SRC_URI="https://github.com/poljar/matrix-nio/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
IUSE="olm"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/aiofiles-23.1.0[${PYTHON_USEDEP}]
	>=dev-python/h11-0.14.0[${PYTHON_USEDEP}]
	>=dev-python/h2-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-4.14.0[${PYTHON_USEDEP}]
	>=dev-python/unpaddedbase64-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.10.1[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-socks-0.8.4[${PYTHON_USEDEP}]
	olm? (
		>=dev-python/python-olm-3.1.3[${PYTHON_USEDEP}]
		>=dev-python/peewee-3.14.4[${PYTHON_USEDEP}]
		>=dev-python/cachetools-4.2.1[${PYTHON_USEDEP}]
		>=dev-python/atomicwrites-1.4.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	test? (
		dev-python/pytest-isort[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
