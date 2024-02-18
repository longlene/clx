# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_1{1..2} )

DISTUTILS_EXT=1
inherit distutils-r1

DESCRIPTION="QUIC and HTTP/3 implementation in Python"
HOMEPAGE="https://github.com/aiortc/aioquic"
SRC_URI="https://github.com/aiortc/aioquic/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
    dev-python/certifi
    >=dev-python/cryptography-42.0.0[${PYTHON_USEDEP}]
    >=dev-python/pylsqpack-0.3.3[${PYTHON_USEDEP}]
    >=dev-python/pyopenssl-24[${PYTHON_USEDEP}]
    >=dev-python/service-identity-24.1.0[${PYTHON_USEDEP}]
"

BDEPEND=""

distutils_enable_tests pytest
