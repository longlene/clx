# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Asynchronous client for SQLite using AnyIO"
HOMEPAGE="
	https://pypi.org/project/sqlite-anyio/
	https://github.com/davidbrochart/sqlite-anyio
"
SRC_URI="https://github.com/davidbrochart/sqlite-anyio/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/anyio-4.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
