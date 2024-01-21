# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_11 )
inherit distutils-r1

DESCRIPTION="CBOR Object Signing and Encryption"
HOMEPAGE="https://github.com/TimothyClaeys/pycose"
SRC_URI="https://github.com/TimothyClaeys/pycose/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/cbor2[${PYTHON_USEDEP}]
	dev-python/ecdsa[${PYTHON_USEDEP}]
	dev-python/attrs[${PYTHON_USEDEP}]
	dev-python/certvalidator[${PYTHON_USEDEP}]
"
BDEPEND="
	test? ( dev-python/flake8[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest
