# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Provider-agnostic agentic coworker runtime"
HOMEPAGE="https://github.com/andrewyng/openworker"
SRC_URI="https://github.com/andrewyng/openworker/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/anthropic-0.40[${PYTHON_USEDEP}]
	~dev-python/aisuite-0_p20260721[${PYTHON_USEDEP}]
	>=dev-python/croniter-2[${PYTHON_USEDEP}]
	>=dev-python/ddgs-9[${PYTHON_USEDEP}]
	dev-python/docstring-parser[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.110[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.23[${PYTHON_USEDEP}]
	>=dev-python/google-genai-1.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.27[${PYTHON_USEDEP}]
	<dev-python/mcp-2[${PYTHON_USEDEP}]
	>=dev-python/mcp-1.1[${PYTHON_USEDEP}]
	>=dev-python/openai-1.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2[${PYTHON_USEDEP}]
	>=dev-python/pypdf-5[${PYTHON_USEDEP}]
	>=dev-python/pypdfium2-4[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6[${PYTHON_USEDEP}]
	>=dev-python/textual-1.0[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.27[${PYTHON_USEDEP}]
	>=dev-python/websockets-13[${PYTHON_USEDEP}]
"
BDEPEND="
	test? ( dev-python/pytest-asyncio[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest

src_prepare() {
	# pyproject.toml hardcodes version = "0.0.0" — the release pipeline only
	# versions the separate Tauri desktop app (surfaces/gui), not this
	# Python package; pin it to PV for correct install metadata
	sed -i -e 's/^version = "0.0.0"$/version = "'"${PV}"'"/' pyproject.toml || die
	distutils-r1_src_prepare
}
