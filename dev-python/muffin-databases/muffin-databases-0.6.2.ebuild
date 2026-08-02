# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry-core
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Async support for a range of databases for Muffin framework"
HOMEPAGE="https://github.com/klen/muffin-databases https://pypi.org/project/muffin-databases/"
SRC_URI="https://github.com/klen/muffin-databases/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="mysql postgres sqlite"
RESTRICT="test"

RDEPEND="
	dev-python/databases[${PYTHON_USEDEP}]
	dev-python/muffin[${PYTHON_USEDEP}]
	mysql? ( dev-python/aiomysql[${PYTHON_USEDEP}] )
	postgres? ( dev-python/asyncpg[${PYTHON_USEDEP}] )
	sqlite? ( dev-python/aiosqlite[${PYTHON_USEDEP}] )
"
