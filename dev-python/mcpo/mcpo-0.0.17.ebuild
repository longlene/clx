# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A simple, secure MCP-to-OpenAPI proxy server"
HOMEPAGE="
	https://pypi.org/project/mcpo/
	https://github.com/open-webui/mcpo
"
SRC_URI="https://github.com/open-webui/mcpo/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/click-8.1.8[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.115.12[${PYTHON_USEDEP}]
	>=dev-python/mcp-1.12.1[${PYTHON_USEDEP}]
	>=dev-python/passlib-1.7.4[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.11.1[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.10.1[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/typer-0.15.2[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.34.0[${PYTHON_USEDEP}]
	>=dev-python/watchdog-4.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-asyncio-0.23.0[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
