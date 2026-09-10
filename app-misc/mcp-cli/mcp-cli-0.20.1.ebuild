# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Command-line interface for the Model Context Protocol"
HOMEPAGE="https://github.com/IBM/mcp-cli"
SRC_URI="https://github.com/IBM/mcp-cli/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/chuk-ai-planner[${PYTHON_USEDEP}]
	dev-python/chuk-ai-session-manager[${PYTHON_USEDEP}]
	>=dev-python/chuk-llm-0.17.1[${PYTHON_USEDEP}]
	>=dev-python/chuk-mcp-client-oauth-0.3.5[${PYTHON_USEDEP}]
	>=dev-python/chuk-term-0.4.2[${PYTHON_USEDEP}]
	>=dev-python/chuk-tool-processor-0.22.1[${PYTHON_USEDEP}]
	>=dev-python/cryptography-44.0.0[${PYTHON_USEDEP}]
	>=dev-python/fast-json-0.3.2[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-4.25.1[${PYTHON_USEDEP}]
	>=dev-python/keyring-25.0.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.11.4[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.50[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/rich-13.9.4[${PYTHON_USEDEP}]
	>=dev-python/typer-0.15.2[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
