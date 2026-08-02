# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Safest and fastest Python library for secp256k1 elliptic curve operations"
HOMEPAGE="
	https://github.com/ofek/coincurve
	https://pypi.org/project/coincurve/
"
SRC_URI="https://github.com/ofek/coincurve/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="|| ( MIT Apache-2.0 )"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

DEPEND="
	>=dev-libs/libsecp256k1-0.6.0[ecdh,recovery,schnorr,extrakeys]
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-build/cmake
	virtual/pkgconfig
	dev-python/cffi[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/scikit-build-core-0.9.0[${PYTHON_USEDEP}]
"

python_compile() {
	COINCURVE_IGNORE_SYSTEM_LIB=OFF distutils-r1_python_compile
}
