# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Python 3 bindings for SQLCipher, DB-API 2.0 compliant"
HOMEPAGE="https://github.com/coleifer/sqlcipher3"
SRC_URI="https://github.com/coleifer/sqlcipher3/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/openssl:="
RDEPEND="${DEPEND}"

src_prepare() {
	default
	# conan is unavailable in Gentoo; setup.py falls back to system paths
	sed -i '/"conan>=/d' pyproject.toml || die
}
