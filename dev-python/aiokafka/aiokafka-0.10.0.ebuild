# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1

DESCRIPTION="asyncio client for kafka"
HOMEPAGE="https://github.com/aio-libs/aiokafka"
SRC_URI="https://github.com/aio-libs/aiokafka/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/async-timeout[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/cython-3.0.5[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
