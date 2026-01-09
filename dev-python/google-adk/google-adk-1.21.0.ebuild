# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Agent Development Kit"
HOMEPAGE="
	https://pypi.org/project/google-adk/
	https://github.com/google/adk-python/
"
SRC_URI="https://github.com/google/adk-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
	>=dev-python/aiosqlite-0.21.0[${PYTHON_USEDEP}]
	>=dev-python/anyio-4.9.0[${PYTHON_USEDEP}]
	>=dev-python/authlib-1.5.1[${PYTHON_USEDEP}]
	>=dev-python/click-8.1.8[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.115.0[${PYTHON_USEDEP}]
	>=dev-python/google-api-python-client-2.157.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-aiplatform-1.125.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-bigquery-storage-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-bigquery-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-bigtable-2.32.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-discoveryengine-0.13.12[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-secret-manager-2.22.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-spanner-3.56.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-speech-2.30.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-storage-2.18.0[${PYTHON_USEDEP}]
	>=dev-python/google-genai-1.55.0[${PYTHON_USEDEP}]
	>=dev-python/graphviz-0.20.2[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-4.23.0[${PYTHON_USEDEP}]
	>=dev-python/mcp-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.37.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-exporter-gcp-logging-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-exporter-gcp-monitoring-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-exporter-gcp-trace-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-exporter-otlp-proto-http-1.36.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-resourcedetector-gcp-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-sdk-1.37.0[${PYTHON_USEDEP}]
	>=dev-python/pyarrow-14.0.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.4[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-spanner-1.14.0[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-2.0[${PYTHON_USEDEP}]
	>=dev-python/starlette-0.49.1[${PYTHON_USEDEP}]
	>=dev-python/tenacity-9.0.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.5[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-5.3[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.34.0[${PYTHON_USEDEP}]
	>=dev-python/watchdog-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-15.0.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/adk-python-${PV}
