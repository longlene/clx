# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Open-source AIOps and alert management platform"
HOMEPAGE="https://github.com/keephq/keep https://keephq.dev"
SRC_URI="https://github.com/keephq/keep/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"

# ee/ directory uses a proprietary enterprise license; standard keep/ code is MIT
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/alembic[${PYTHON_USEDEP}]
		dev-python/anthropic[${PYTHON_USEDEP}]
		dev-python/asteval[${PYTHON_USEDEP}]
		dev-python/azure-identity[${PYTHON_USEDEP}]
		dev-python/boto3[${PYTHON_USEDEP}]
		>=dev-python/click-8.1.3[${PYTHON_USEDEP}]
		dev-python/elasticsearch[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/google-auth[${PYTHON_USEDEP}]
		dev-python/google-cloud-bigquery[${PYTHON_USEDEP}]
		dev-python/google-cloud-logging[${PYTHON_USEDEP}]
		dev-python/google-cloud-secret-manager[${PYTHON_USEDEP}]
		dev-python/google-cloud-storage[${PYTHON_USEDEP}]
		dev-python/google-cloud-trace[${PYTHON_USEDEP}]
		dev-python/google-generativeai[${PYTHON_USEDEP}]
		dev-python/httptools[${PYTHON_USEDEP}]
		dev-python/hvac[${PYTHON_USEDEP}]
		dev-python/json5[${PYTHON_USEDEP}]
		dev-python/kafka-python[${PYTHON_USEDEP}]
		dev-python/openai[${PYTHON_USEDEP}]
		dev-python/opentelemetry-exporter-gcp-trace[${PYTHON_USEDEP}]
		dev-python/opentelemetry-exporter-otlp-proto-http[${PYTHON_USEDEP}]
		dev-python/opentelemetry-instrumentation-fastapi[${PYTHON_USEDEP}]
		dev-python/opentelemetry-instrumentation-requests[${PYTHON_USEDEP}]
		dev-python/opentelemetry-instrumentation-sqlalchemy[${PYTHON_USEDEP}]
		dev-python/opentelemetry-sdk[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/paramiko[${PYTHON_USEDEP}]
		dev-python/posthog[${PYTHON_USEDEP}]
		dev-python/prettytable[${PYTHON_USEDEP}]
		dev-python/prometheus-client[${PYTHON_USEDEP}]
		dev-python/prometheus-fastapi-instrumentator[${PYTHON_USEDEP}]
		dev-python/psycopg[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/pygithub[${PYTHON_USEDEP}]
		dev-python/pymongo[${PYTHON_USEDEP}]
		dev-python/pymysql[${PYTHON_USEDEP}]
		dev-python/python-dotenv[${PYTHON_USEDEP}]
		dev-python/python-json-logger[${PYTHON_USEDEP}]
		dev-python/python-multipart[${PYTHON_USEDEP}]
		dev-python/python-telegram-bot[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.4[${PYTHON_USEDEP}]
		dev-python/sentry-sdk[${PYTHON_USEDEP}]
		dev-python/sqlalchemy[${PYTHON_USEDEP}]
		dev-python/sqlalchemy-utils[${PYTHON_USEDEP}]
		dev-python/twilio[${PYTHON_USEDEP}]
		>=dev-python/urllib3-1.26[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/uvloop[${PYTHON_USEDEP}]
		dev-python/validators[${PYTHON_USEDEP}]
		dev-python/websocket-client[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"
