# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A MCP server which proxies requests to a remote MCP server over SSE transport"
HOMEPAGE="
	https://pypi.org/project/mcp-proxy/
	https://github.com/sparfenyuk/mcp-proxy
"
SRC_URI="https://github.com/sparfenyuk/mcp-proxy/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/mcp-1.5.0[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.34.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
