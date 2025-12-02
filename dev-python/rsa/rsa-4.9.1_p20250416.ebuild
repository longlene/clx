# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

EGIT_COMMIT="42b0e14ffbeeb9d99d1037e6440a2cc61780e4ea"

MY_P=python-rsa-version-${PV}
DESCRIPTION="Pure-Python RSA implementation"
HOMEPAGE="
	https://stuvel.eu/rsa/
	https://github.com/sybrenstuvel/python-rsa/
	https://pypi.org/project/rsa/
"
SRC_URI="
	https://github.com/sybrenstuvel/python-rsa/archive/${EGIT_COMMIT}.tar.gz
		-> ${MY_P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 ppc ppc64 ~riscv ~sparc x86"

RDEPEND="
	>=dev-python/pyasn1-0.1.3[${PYTHON_USEDEP}]
"

distutils_enable_tests unittest

S="${WORKDIR}"/python-rsa-${EGIT_COMMIT}

src_prepare() {
	rm tests/test_mypy.py || die
	distutils-r1_src_prepare
}
