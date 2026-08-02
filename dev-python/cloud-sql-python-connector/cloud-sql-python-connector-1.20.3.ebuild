# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A Python library for connecting securely to your Cloud SQL instances"
HOMEPAGE="https://github.com/GoogleCloudPlatform/cloud-sql-python-connector"
SRC_URI="https://github.com/GoogleCloudPlatform/cloud-sql-python-connector/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="asyncpg pg8000 pymysql pytds"
RESTRICT="test"

RDEPEND="
	dev-python/aiofiles[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/cryptography-42.0.0[${PYTHON_USEDEP}]
	>=dev-python/dnspython-2.0.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.28.0[${PYTHON_USEDEP}]
	asyncpg? ( >=dev-python/asyncpg-0.30.0[${PYTHON_USEDEP}] )
	pg8000? ( >=dev-python/pg8000-1.31.1[${PYTHON_USEDEP}] )
	pymysql? ( >=dev-python/pymysql-1.1.0[${PYTHON_USEDEP}] )
	pytds? ( >=dev-python/python-tds-1.15.0[${PYTHON_USEDEP}] )
"
