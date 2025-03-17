# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="WebRTC and ORTC implementation for Python using asyncio"
HOMEPAGE="https://github.com/aiortc/aiortc"
SRC_URI="https://github.com/aiortc/aiortc/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aioice-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/av-9.0.0[${PYTHON_USEDEP}]
	>=dev-python/cffi-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-42.0.0[${PYTHON_USEDEP}]
	>=dev-python/google-crc32c-1.1[${PYTHON_USEDEP}]
	>=dev-python/pyee-9.0.0[${PYTHON_USEDEP}]
	>=dev-python/pylibsrtp-0.10.0[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-24.0.0[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"
