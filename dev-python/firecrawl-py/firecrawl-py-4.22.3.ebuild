# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 pypi

#MY_PN="firecrawl"
#MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python SDK for Firecrawl API"
HOMEPAGE="
	https://pypi.org/project/firecrawl/
	https://github.com/firecrawl/firecrawl
"
#SRC_URI="https://github.com/firecrawl/firecrawl/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.gh.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/python-dotenv[${PYTHON_USEDEP}]
	dev-python/websockets[${PYTHON_USEDEP}]
	dev-python/nest-asyncio[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

#S="${WORKDIR}"/${MY_P}/apps/python-sdk

src_prepare() {
	default
	rm -rf tests
	distutils-r1_src_prepare
}
