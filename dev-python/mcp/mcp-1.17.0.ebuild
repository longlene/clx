# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Model Context Protocol SDK"
HOMEPAGE="
	https://pypi.org/project/mcp/
	https://github.com/modelcontextprotocol/python-sdk/
"
SRC_URI="https://github.com/modelcontextprotocol/python-sdk/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/anyio-4.5[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.27.1[${PYTHON_USEDEP}]
	>=dev-python/httpx-sse-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.11.0[${PYTHON_USEDEP}]
	>=dev-python/starlette-0.27[${PYTHON_USEDEP}]
	>=dev-python/python-multipart-0.0.9[${PYTHON_USEDEP}]
	>=dev-python/sse-starlette-1.6.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-settings-2.5.2[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.31.1[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-4.20.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/uv-dynamic-versioning[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/python-sdk-${PV}

export UV_DYNAMIC_VERSIONING_BYPASS="${PV}"
