# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Async Web Automation in Python"
HOMEPAGE="
	https://pypi.org/project/pydoll/
	https://github.com/autoscrape-labs/pydoll
"
SRC_URI="https://github.com/autoscrape-labs/pydoll/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/websockets-13.1[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.9.5[${PYTHON_USEDEP}]
	>=dev-python/aiofiles-23.2.1[${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup4-0.0.2[${PYTHON_USEDEP}]
	>=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
