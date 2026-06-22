# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Ultra-fast websocket client and server for asyncio"
HOMEPAGE="https://github.com/tarasko/picows https://picows.readthedocs.io/"
SRC_URI="https://github.com/tarasko/picows/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

# dev-python/aiofastnet is not yet packaged in portage.

BDEPEND="
	>=dev-python/cython-3.2[${PYTHON_USEDEP}]
	>=dev-python/setuptools-78.0[${PYTHON_USEDEP}]
"

RDEPEND="
	dev-python/multidict[${PYTHON_USEDEP}]
	dev-python/python-socks[${PYTHON_USEDEP}]
"
