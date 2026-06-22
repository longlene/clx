# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
# upstream excludes !=3.15
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 pypi

DESCRIPTION="Python Task SDK for Apache Airflow DAG Authors"
HOMEPAGE="
	https://airflow.apache.org/
	https://github.com/apache/airflow
	https://pypi.org/project/apache-airflow-task-sdk/
"
S="${WORKDIR}/apache_airflow_task_sdk-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="datadog opentelemetry sentry statsd"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/apache-airflow-core-3.2.0[${PYTHON_USEDEP}]
		<dev-python/apache-airflow-core-3.3.0[${PYTHON_USEDEP}]
		>=dev-python/asgiref-3.11.1[${PYTHON_USEDEP}]
		>=dev-python/attrs-24.2.0[${PYTHON_USEDEP}]
		>=dev-python/babel-2.17.0[${PYTHON_USEDEP}]
		>=dev-python/colorlog-6.8.2[${PYTHON_USEDEP}]
		>=dev-python/fsspec-2023.10.0[${PYTHON_USEDEP}]
		>=dev-python/greenback-1.2.1[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.1.5[${PYTHON_USEDEP}]
		>=dev-python/jsonschema-4.19.1[${PYTHON_USEDEP}]
		>=dev-python/methodtools-0.4.7[${PYTHON_USEDEP}]
		>=dev-python/msgspec-0.19.0[${PYTHON_USEDEP}]
		>=dev-python/packaging-25.0[${PYTHON_USEDEP}]
		>=dev-python/pathspec-0.9.0[${PYTHON_USEDEP}]
		>=dev-python/pendulum-3.1.0[${PYTHON_USEDEP}]
		>=dev-python/pluggy-1.5.0[${PYTHON_USEDEP}]
		>=dev-python/psutil-6.1.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.11.0[${PYTHON_USEDEP}]
		>=dev-python/pygtrie-2.5.0[${PYTHON_USEDEP}]
		>=dev-python/python-dateutil-2.7.0[${PYTHON_USEDEP}]
		>=dev-python/structlog-25.4.0[${PYTHON_USEDEP}]
		>=dev-python/tenacity-8.3.0[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.14.1[${PYTHON_USEDEP}]
		datadog? ( >=dev-python/datadog-0.50.0[${PYTHON_USEDEP}] )
		opentelemetry? (
			>=dev-python/opentelemetry-api-1.27.0[${PYTHON_USEDEP}]
			>=dev-python/opentelemetry-exporter-otlp-1.27.0[${PYTHON_USEDEP}]
		)
		sentry? ( >=dev-python/sentry-sdk-2.30.0[${PYTHON_USEDEP}] )
		statsd? ( >=dev-python/statsd-3.3.0[${PYTHON_USEDEP}] )
	')
"

RESTRICT="test"
