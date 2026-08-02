# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Merkle DAG implementation for IPLD in Python"
HOMEPAGE="https://github.com/ipld/py-ipld-dag"
SRC_URI="https://github.com/ipld/py-ipld-dag/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/cbor2-5.4.0[${PYTHON_USEDEP}]
	>=dev-python/py-cid-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/py-multihash-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/base58-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/py-multibase-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/py-multicodec-1.0.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
