# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 pypi

DESCRIPTION="MCP tooling: client, code generation, tool server, approval workflow"
HOMEPAGE="https://pypi.org/project/mcpygen/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aiofiles-25.1.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.13.2[${PYTHON_USEDEP}]
	>=dev-python/datamodel-code-generator-0.49.0[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.121.2[${PYTHON_USEDEP}]
	>=dev-python/mcp-1.26.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.5[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.40.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-15.0.1[${PYTHON_USEDEP}]
	>=dev-python/wsproto-1.3.2[${PYTHON_USEDEP}]
"
