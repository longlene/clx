# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="MCP server proxying requests to remote MCP servers over streamable HTTP or SSE"
HOMEPAGE="
	https://pypi.org/project/mcp-proxy/
	https://github.com/sparfenyuk/mcp-proxy
"
SRC_URI="https://github.com/sparfenyuk/mcp-proxy/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/httpx-auth-0.22.0[${PYTHON_USEDEP}]
	>=dev-python/mcp-1.17.0[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.34.0[${PYTHON_USEDEP}]
"
