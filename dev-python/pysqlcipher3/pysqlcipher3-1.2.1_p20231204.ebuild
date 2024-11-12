# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

EGIT_COMMIT="e10b09c569ea60d4a9a5289d9d67112eb0f2c95a"

DESCRIPTION="Python 3 bindings for SQLCipher"
HOMEPAGE="https://github.com/rigglemania/pysqlcipher3"
SRC_URI="https://github.com/rigglemania/pysqlcipher3/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-db/sqlcipher
"
RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
