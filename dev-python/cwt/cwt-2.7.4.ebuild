# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

DESCRIPTION="A Python implementation of CWT/COSE"
HOMEPAGE="https://github.com/dajiaji/python-cwt"
SRC_URI="https://github.com/dajiaji/python-cwt/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/asn1crypto-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/cbor2-5.4.2[${PYTHON_USEDEP}]
	>=dev-python/certvalidator-0.11.1[${PYTHON_USEDEP}]
	>=dev-python/cryptography-42.0.1[${PYTHON_USEDEP}]
	>=dev-python/pyhpke-0.5.3[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

S="${WORKDIR}"/python-${P}
