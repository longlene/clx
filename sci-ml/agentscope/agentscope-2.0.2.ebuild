# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Flexible yet robust multi-agent platform for building AI agents"
HOMEPAGE="
	https://docs.agentscope.io/
	https://github.com/agentscope-ai/agentscope
"
SRC_URI="https://github.com/agentscope-ai/agentscope/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gemini models ollama service storage tools workspace xai"

RDEPEND="
	dev-python/aiofiles[${PYTHON_USEDEP}]
	dev-python/aioitertools[${PYTHON_USEDEP}]
	dev-python/anthropic[${PYTHON_USEDEP}]
	dev-python/docstring-parser[${PYTHON_USEDEP}]
	dev-python/filetype[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/json5[${PYTHON_USEDEP}]
	dev-python/json-repair[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/mcp[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/openai[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.39.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-sdk-1.39.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-exporter-otlp-1.39.0[${PYTHON_USEDEP}]
	dev-python/opentelemetry-semantic-conventions[${PYTHON_USEDEP}]
	dev-python/python-datauri[${PYTHON_USEDEP}]
	dev-python/python-frontmatter[${PYTHON_USEDEP}]
	dev-python/python-socketio[${PYTHON_USEDEP}]
	dev-python/shortuuid[${PYTHON_USEDEP}]
	dev-python/tree-sitter[${PYTHON_USEDEP}]
	dev-libs/tree-sitter-bash
	dev-python/dashscope[${PYTHON_USEDEP}]
	gemini? ( dev-python/google-genai[${PYTHON_USEDEP}] )
	ollama? ( >=dev-python/ollama-0.5.4[${PYTHON_USEDEP}] )
	xai? ( dev-python/xai-sdk[${PYTHON_USEDEP}] )
	service? (
		dev-python/apscheduler[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		>=dev-python/ag-ui-protocol-0.1.10[${PYTHON_USEDEP}]
	)
	storage? ( dev-python/redis[${PYTHON_USEDEP}] )
	workspace? (
		dev-python/aiodocker[${PYTHON_USEDEP}]
		dev-python/e2b[${PYTHON_USEDEP}]
	)
	tools? ( sys-apps/ripgrep )
"

REQUIRED_USE="models? ( ollama gemini xai )"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
