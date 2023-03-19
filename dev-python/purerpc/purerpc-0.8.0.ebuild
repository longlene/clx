# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10,11} )
inherit distutils-r1

DESCRIPTION="Native, async Python gRPC client and server implementation"
HOMEPAGE="https://github.com/python-trio/purerpc"
SRC_URI="https://github.com/python-trio/purerpc/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/h2-3.1.1[${PYTHON_USEDEP}]
	>=dev-python/anyio-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/async_generator-1.10[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest
