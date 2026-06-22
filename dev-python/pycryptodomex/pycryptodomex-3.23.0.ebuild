# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1 pypi

DESCRIPTION="Cryptographic library for Python (Cryptodome namespace)"
HOMEPAGE="https://www.pycryptodome.org/ https://pypi.org/project/pycryptodomex/"

LICENSE="BSD-2 Unlicense"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/gmp:=
	>=dev-libs/libtomcrypt-1.18.2-r1:=
"
RDEPEND="${DEPEND}"
BDEPEND="
	$(python_gen_cond_dep 'dev-python/cffi[${PYTHON_USEDEP}]' 'python*')
"

PATCHES=(
	"${FILESDIR}/pycryptodomex-3.23.0-system-libtomcrypt.patch"
)

python_prepare_all() {
	rm -r src/libtom || die
	distutils-r1_python_prepare_all
}
