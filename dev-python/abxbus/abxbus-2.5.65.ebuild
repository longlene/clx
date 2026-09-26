# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Pydantic-powered event bus with async support"
HOMEPAGE="https://github.com/ArchiveBox/abxbus https://pypi.org/project/abxbus/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="postgres redis"
RESTRICT="test"

RDEPEND="
	>=dev-python/pydantic-2.13.4[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.15.0[${PYTHON_USEDEP}]
	>=dev-python/uuid7-0.1.0[${PYTHON_USEDEP}]
	postgres? ( >=dev-python/asyncpg-0.31.0[${PYTHON_USEDEP}] )
	redis? ( >=dev-python/redis-7.4.0[${PYTHON_USEDEP}] )
"
