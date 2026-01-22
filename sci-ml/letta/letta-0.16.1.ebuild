# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Create LLM agents with long-term memory and custom tools"
HOMEPAGE="
	https://pypi.org/project/letta/
	https://github.com/letta-ai/letta/
"
SRC_URI="https://github.com/letta-ai/letta/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/typer-0.15.2[${PYTHON_USEDEP}]
	>=dev-python/questionary-2.0.1[${PYTHON_USEDEP}]
	>=dev-python/pytz-2023.3[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.66.1[${PYTHON_USEDEP}]
	>=dev-python/black-24.2.0[${PYTHON_USEDEP}]
	>=dev-python/setuptools-70[${PYTHON_USEDEP}]
	>=dev-python/prettytable-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/docstring-parser-0.16[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/demjson3-3.0.6[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-json-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.10.6[${PYTHON_USEDEP}]
	>=dev-python/html2text-2020.1.16[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-2.0.41[${PYTHON_USEDEP}]
	>=dev-python/python-box-7.1.1[${PYTHON_USEDEP}]
	>=dev-python/sqlmodel-0.0.16[${PYTHON_USEDEP}]
	>=dev-python/python-multipart-0.0.19[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-utils-0.41.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-settings-2.2.1[${PYTHON_USEDEP}]
	>=dev-python/httpx-sse-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/nltk-3.8.1[${PYTHON_USEDEP}]
	>=dev-python/alembic-1.13.3[${PYTHON_USEDEP}]
	>=dev-python/pyhumps-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/pathvalidate-3.2.1[${PYTHON_USEDEP}]
	>=dev-python/sentry-sdk-2.19.1[${PYTHON_USEDEP}]
	>=dev-python/rich-13.9.4[${PYTHON_USEDEP}]
	>=app-arch/brotli-1.1.0[python,${PYTHON_USEDEP}]
	>=dev-python/grpcio-1.68.1[${PYTHON_USEDEP}]
	>=sci-ml/llama-index-0.12.2[${PYTHON_USEDEP}]
	>=sci-ml/llama-index-embeddings-openai-0.3.1[${PYTHON_USEDEP}]
	>=dev-python/anthropic-0.75.0[${PYTHON_USEDEP}]
	>=sci-ml/letta-client-1.3.1[${PYTHON_USEDEP}]
	>=dev-python/openai-2.11.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.30.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-sdk-1.30.0[${PYTHON_USEDEP}]
	dev-python/opentelemetry-instrumentation-requests[${PYTHON_USEDEP}]
	dev-python/opentelemetry-instrumentation-sqlalchemy[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-exporter-otlp-1.30.0[${PYTHON_USEDEP}]
	>=dev-python/faker-36.1.0[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.4.6[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-sqlalchemy-1.4.1[${PYTHON_USEDEP}]
	>=dev-python/datamodel-code-generator-0.25.0[${PYTHON_USEDEP}]
	>=dev-python/mcp-1.9.4[${PYTHON_USEDEP}]
	>=dev-python/exa-py-1.15.4[${PYTHON_USEDEP}]
	>=dev-python/apscheduler-3.11.0[${PYTHON_USEDEP}]
	>=dev-python/aiomultiprocess-0.9.1[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3.10.1[${PYTHON_USEDEP}]
	>=dev-python/tavily-python-0.7.2[${PYTHON_USEDEP}]
	>=dev-python/temporalio-1.8.0[${PYTHON_USEDEP}]
	>=dev-python/mistralai-1.8.1[${PYTHON_USEDEP}]
	>=dev-python/structlog-25.4.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2025.6.15[${PYTHON_USEDEP}]
	>=dev-python/markitdown-0.1.2[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.11.1[${PYTHON_USEDEP}]
	>=dev-python/ruff-0.12.10[${PYTHON_USEDEP}]
	dev-python/trafilatura[${PYTHON_USEDEP}]
	dev-python/readability-lxml[${PYTHON_USEDEP}]
	>=dev-python/google-genai-1.52.0[${PYTHON_USEDEP}]
	>=dev-python/datadog-0.49.1[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.9.0[${PYTHON_USEDEP}]
	>=dev-python/ddtrace-4.0.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}"/install-fix.patch
)
