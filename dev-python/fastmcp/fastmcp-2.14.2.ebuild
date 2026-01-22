# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="The fast, Pythonic way to build MCP servers"
HOMEPAGE="
	https://pypi.org/project/fastmcp/
	https://github.com/jlowin/fastmcp
"
SRC_URI="https://github.com/jlowin/fastmcp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/python-dotenv-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/exceptiongroup-1.2.2[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	>=dev-python/mcp-1.24.0[${PYTHON_USEDEP}]
	>=dev-python/openapi-pydantic-0.5.1[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/pydocket-0.16.3[${PYTHON_USEDEP}]
	>=dev-python/rich-13.9.4[${PYTHON_USEDEP}]
	>=dev-python/cyclopts-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/authlib-1.6.5[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.11.7[${PYTHON_USEDEP}]
	>=dev-python/pyperclip-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/py-key-value-aio-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.35[${PYTHON_USEDEP}]
	>=dev-python/websockets-15.0.1[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-path-0.3.4[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

export UV_DYNAMIC_VERSIONING_BYPASS="${PV}"
