# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Automate browser-based workflows with AI"
HOMEPAGE="https://www.skyvern.com https://github.com/Skyvern-AI/skyvern"
SRC_URI="https://github.com/Skyvern-AI/skyvern/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="local"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/cachetools[${PYTHON_USEDEP}]
		>=dev-python/click-8[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}]
		dev-python/orjson[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.5.2[${PYTHON_USEDEP}]
		>=dev-python/pydantic-settings-2.1.0[${PYTHON_USEDEP}]
		dev-python/python-dotenv[${PYTHON_USEDEP}]
		>=dev-python/rich-13.7.0[${PYTHON_USEDEP}]
		>=dev-python/structlog-23.2.0[${PYTHON_USEDEP}]
		>=dev-python/typer-0.16.0[${PYTHON_USEDEP}]
		local? (
			>=dev-python/aiofiles-24.1.0[${PYTHON_USEDEP}]
			>=dev-python/aiohttp-3.13.4[${PYTHON_USEDEP}]
			>=dev-python/aioboto3-14.3.0[${PYTHON_USEDEP}]
			>=dev-python/aiosqlite-0.21.0[${PYTHON_USEDEP}]
			>=dev-python/alembic-1.12.1[${PYTHON_USEDEP}]
			>=dev-python/anthropic-0.97.0[${PYTHON_USEDEP}]
			>=dev-python/asyncpg-0.30.0[${PYTHON_USEDEP}]
			>=dev-python/authlib-1.7.1[${PYTHON_USEDEP}]
			>=dev-python/azure-identity-1.24.0[${PYTHON_USEDEP}]
			>=dev-python/azure-storage-blob-12.26.0[${PYTHON_USEDEP}]
			>=dev-python/croniter-1.3.8[${PYTHON_USEDEP}]
			>=dev-python/email-validator-2.2.0[${PYTHON_USEDEP}]
			>=dev-python/fastapi-0.136.1[${PYTHON_USEDEP}]
			>=dev-python/fastmcp-3.2.0[${PYTHON_USEDEP}]
			dev-python/filetype[${PYTHON_USEDEP}]
			>=dev-python/google-auth-2.49.2[${PYTHON_USEDEP}]
			>=dev-python/google-auth-oauthlib-1.3.1[${PYTHON_USEDEP}]
			>=dev-python/google-cloud-aiplatform-1.149.0[${PYTHON_USEDEP}]
			>=dev-python/greenlet-3.0.3[${PYTHON_USEDEP}]
			>=dev-python/jinja2-3.1.2[${PYTHON_USEDEP}]
			>=dev-python/json5-0.13.0[${PYTHON_USEDEP}]
			dev-python/json-repair[${PYTHON_USEDEP}]
			>=dev-python/jsonschema-4.23.0[${PYTHON_USEDEP}]
			>=dev-python/lark-1.2.2[${PYTHON_USEDEP}]
			>=dev-python/libcst-1.8.2[${PYTHON_USEDEP}]
			>=dev-python/openai-1.68.2[${PYTHON_USEDEP}]
			dev-python/openai-agents[${PYTHON_USEDEP}]
			>=dev-python/opentelemetry-api-1.41.1[${PYTHON_USEDEP}]
			>=dev-python/pandas-2.3.1[${PYTHON_USEDEP}]
			>=dev-python/pdfplumber-0.11.0[${PYTHON_USEDEP}]
			>=dev-python/pillow-10.2.0[${PYTHON_USEDEP}]
			>=dev-python/posthog-3.7.0[${PYTHON_USEDEP}]
			>=dev-python/psutil-7.0.0[${PYTHON_USEDEP}]
			dev-python/psycopg[${PYTHON_USEDEP}]
			>=dev-python/pyasn1-0.6.3[${PYTHON_USEDEP}]
			>=dev-python/pyjwt-2.12.0[${PYTHON_USEDEP}]
			>=dev-python/pyotp-2.9.0[${PYTHON_USEDEP}]
			>=dev-python/pypdf-6.7.5[${PYTHON_USEDEP}]
			>=dev-python/python-docx-1.1.0[${PYTHON_USEDEP}]
			>=dev-python/python-multipart-0.0.27[${PYTHON_USEDEP}]
			>=dev-python/requests-toolbelt-1.0.0[${PYTHON_USEDEP}]
			>=dev-python/sse-starlette-3.4.1[${PYTHON_USEDEP}]
			>=dev-python/sqlalchemy-2.0.29[${PYTHON_USEDEP}]
			>=dev-python/tiktoken-0.9.0[${PYTHON_USEDEP}]
			>=dev-python/tldextract-5.1.2[${PYTHON_USEDEP}]
			>=dev-python/toml-0.10.2[${PYTHON_USEDEP}]
			>=dev-python/tornado-6.5.5[${PYTHON_USEDEP}]
			>=dev-python/urllib3-2.7.0[${PYTHON_USEDEP}]
			>=dev-python/websockets-12.0[${PYTHON_USEDEP}]
			>=dev-python/zstandard-0.25.0[${PYTHON_USEDEP}]
			dev-python/asyncache[${PYTHON_USEDEP}]
			dev-python/curlparser[${PYTHON_USEDEP}]
			dev-python/fuzzysearch[${PYTHON_USEDEP}]
			dev-python/litellm[${PYTHON_USEDEP}]
			dev-python/playwright[${PYTHON_USEDEP}]
			dev-python/python-calamine[${PYTHON_USEDEP}]
			dev-python/starlette-context[${PYTHON_USEDEP}]
			dev-python/yutori[${PYTHON_USEDEP}]
		)
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/hatchling[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"
