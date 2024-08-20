# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A reimplementation of python Dataclasses supporting true inheritance"
HOMEPAGE="https://github.com/phenobarbital/python-datamodel/"
SRC_URI="https://github.com/phenobarbital/python-datamodel/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.26.4[${PYTHON_USEDEP}]
	>=dev-python/uvloop-0.19.0[${PYTHON_USEDEP}]
	>=dev-python/asyncio-3.4.3[${PYTHON_USEDEP}]
	>=dev-python/faust-cchardet-2.1.19[${PYTHON_USEDEP}]
	>=dev-python/ciso8601-2.3.1[${PYTHON_USEDEP}]
	>=dev-python/objectpath-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.10.3[${PYTHON_USEDEP}]
	>=dev-python/typing_extensions-4.9.0[${PYTHON_USEDEP}]
	>=dev-python/asyncpg-0.29.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.2[${PYTHON_USEDEP}]
	>=dev-python/pendulum-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-slugify-8.0.1[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	test? (
		>=dev-python/pytest-asyncio-0.23.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-xdist-3.5.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-assume-2.4.3[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
