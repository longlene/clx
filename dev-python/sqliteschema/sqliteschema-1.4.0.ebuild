# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A Python library to dump table schema of a SQLite database file"
HOMEPAGE="
	https://pypi.org/project/sqliteschema/
"
SRC_URI="https://github.com/thombashi/sqliteschema/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/mbstrdecoder-0.8.3[${PYTHON_USEDEP}]
	>=dev-python/tabledata-1.3.1[${PYTHON_USEDEP}]
	>=dev-python/typepy-1.1.4[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
