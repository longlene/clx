# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="MCP server for browser automation via browser-use"
HOMEPAGE="https://github.com/kontext-security/browser-use-mcp-server"
SRC_URI="https://github.com/kontext-security/browser-use-mcp-server/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/browser-use-0.1.40[${PYTHON_USEDEP}]
	>=dev-python/click-8.1.8[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	>=sci-ml/langchain-openai-0.3.1[${PYTHON_USEDEP}]
	>=dev-python/mcp-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.10.6[${PYTHON_USEDEP}]
	dev-python/anyio[${PYTHON_USEDEP}]
	dev-python/python-dotenv[${PYTHON_USEDEP}]
	>=dev-python/python-json-logger-2.0.7[${PYTHON_USEDEP}]
	dev-python/starlette[${PYTHON_USEDEP}]
	dev-python/uvicorn[${PYTHON_USEDEP}]
	>=dev-python/playwright-1.50.0[${PYTHON_USEDEP}]
"

src_prepare() {
	sed -i \
		-e 's/dynamic = \["version"\]/version = "'"${PV}"'"/' \
		-e 's/, "uv-dynamic-versioning"//' \
		-e 's/"uv-dynamic-versioning", //' \
		pyproject.toml || die
	distutils-r1_src_prepare
}
