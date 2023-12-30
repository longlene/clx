# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_11 )

inherit distutils-r1 pypi

DESCRIPTION="asyncio-based Interactive Connectivity Establishment (RFC 5245)"
HOMEPAGE="https://github.com/aiortc/aioice"
SRC_URI="https://github.com/aiortc/aioice/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/dnspython-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/ifaddr-0.2.0[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"
