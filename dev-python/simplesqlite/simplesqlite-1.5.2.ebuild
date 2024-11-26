# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A Python library to simplify SQLite database operations"
HOMEPAGE="
	https://github.com/thombashi/SimpleSQLite
	https://pypi.org/project/simplesqlite/
"
SRC_URI="https://github.com/thombashi/SimpleSQLite/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/dataproperty-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/mbstrdecoder-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/pathvalidate-2.5.2[${PYTHON_USEDEP}]
	>=dev-python/sqliteschema-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/tabledata-1.1.3[${PYTHON_USEDEP}]
	>=dev-python/typepy-1.2.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/SimpleSQLite-${PV}
