# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Interaction control harness for controlled, predictable LLM interactions"
HOMEPAGE="https://www.parlant.io https://github.com/emcie-co/parlant"
SRC_URI="https://github.com/emcie-co/parlant/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="azure gemini mongo ollama qdrant"

RDEPEND="
	sci-ml/tokenizers
	$(python_gen_cond_dep '
		dev-python/aiofiles[${PYTHON_USEDEP}]
		dev-python/aiopenapi3[${PYTHON_USEDEP}]
		dev-python/aiorwlock[${PYTHON_USEDEP}]
		dev-python/authlib[${PYTHON_USEDEP}]
		dev-python/boto3[${PYTHON_USEDEP}]
		dev-python/cachetools[${PYTHON_USEDEP}]
		dev-python/click[${PYTHON_USEDEP}]
		dev-python/colorama[${PYTHON_USEDEP}]
		dev-python/coloredlogs[${PYTHON_USEDEP}]
		dev-python/croniter[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/fastmcp[${PYTHON_USEDEP}]
		dev-python/griffe[${PYTHON_USEDEP}]
		dev-python/httpx[${PYTHON_USEDEP}]
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/jsonfinder[${PYTHON_USEDEP}]
		dev-python/jsonschema[${PYTHON_USEDEP}]
		dev-python/lagom[${PYTHON_USEDEP}]
		dev-python/limits[${PYTHON_USEDEP}]
		dev-python/mcp[${PYTHON_USEDEP}]
		dev-python/more-itertools[${PYTHON_USEDEP}]
		dev-python/nano-vectordb[${PYTHON_USEDEP}]
		dev-python/nanoid[${PYTHON_USEDEP}]
		dev-python/networkx[${PYTHON_USEDEP}]
		dev-python/openai[${PYTHON_USEDEP}]
		dev-python/openapi3-parser[${PYTHON_USEDEP}]
		dev-python/opentelemetry-api[${PYTHON_USEDEP}]
		dev-python/opentelemetry-exporter-otlp[${PYTHON_USEDEP}]
		dev-python/opentelemetry-instrumentation[${PYTHON_USEDEP}]
		dev-python/opentelemetry-sdk[${PYTHON_USEDEP}]
		dev-python/parlant-client[${PYTHON_USEDEP}]
		dev-python/python-dateutil[${PYTHON_USEDEP}]
		dev-python/python-dotenv[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-python/semver[${PYTHON_USEDEP}]
		dev-python/starlette[${PYTHON_USEDEP}]
		dev-python/structlog[${PYTHON_USEDEP}]
		dev-python/tabulate[${PYTHON_USEDEP}]
		dev-python/tiktoken[${PYTHON_USEDEP}]
		dev-python/toml[${PYTHON_USEDEP}]
		dev-python/types-aiofiles[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/websocket-client[${PYTHON_USEDEP}]
		dev-python/wsproto[${PYTHON_USEDEP}]
		azure? ( dev-python/azure-identity[${PYTHON_USEDEP}] )
		gemini? (
			dev-python/google-genai[${PYTHON_USEDEP}]
			dev-python/google-api-core[${PYTHON_USEDEP}]
		)
		mongo? ( dev-python/pymongo[${PYTHON_USEDEP}] )
		ollama? ( dev-python/ollama[${PYTHON_USEDEP}] )
		qdrant? ( dev-python/qdrant-client[${PYTHON_USEDEP}] )
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/hatchling[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"
