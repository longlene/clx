# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
# upstream excludes !=3.15
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 pypi

DESCRIPTION="Core packages for Apache Airflow, schedule and API server"
HOMEPAGE="
	https://airflow.apache.org/
	https://github.com/apache/airflow
	https://pypi.org/project/apache-airflow-core/
"
S="${WORKDIR}/apache_airflow_core-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="graphviz gunicorn statsd"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/a2wsgi-1.10.8[${PYTHON_USEDEP}]
		>=dev-python/cachetools-6.0.0[${PYTHON_USEDEP}]
		>=dev-python/aiosqlite-0.20.0[${PYTHON_USEDEP}]
		>=dev-python/alembic-1.13.1[${PYTHON_USEDEP}]
		<dev-python/alembic-2[${PYTHON_USEDEP}]
		>=dev-python/argcomplete-1.10[${PYTHON_USEDEP}]
		>=dev-python/asgiref-3.11.1[${PYTHON_USEDEP}]
		>=dev-python/attrs-22.1.0[${PYTHON_USEDEP}]
		>=dev-python/cadwyn-6.1.1[${PYTHON_USEDEP}]
		>=dev-python/colorlog-6.8.2[${PYTHON_USEDEP}]
		>=dev-python/cron-descriptor-1.2.24[${PYTHON_USEDEP}]
		>=dev-python/croniter-2.0.2[${PYTHON_USEDEP}]
		>=dev-python/cryptography-44.0.3[${PYTHON_USEDEP}]
		>=dev-python/deprecated-1.2.13[${PYTHON_USEDEP}]
		>=dev-python/dill-0.2.2[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.129.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.37.0[${PYTHON_USEDEP}]
		>=dev-python/starlette-1.0.1[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.25.0[${PYTHON_USEDEP}]
		>=dev-python/importlib-metadata-7.0[${PYTHON_USEDEP}]
		>=dev-python/itsdangerous-2.0[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.1.5[${PYTHON_USEDEP}]
		>=dev-python/jsonschema-4.19.1[${PYTHON_USEDEP}]
		>=dev-python/lazy-object-proxy-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/libcst-1.8.2[${PYTHON_USEDEP}]
		>=dev-python/linkify-it-py-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/lockfile-0.12.2[${PYTHON_USEDEP}]
		>=dev-python/methodtools-0.4.7[${PYTHON_USEDEP}]
		>=dev-python/natsort-8.4.0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-api-1.27.0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-exporter-otlp-1.27.0[${PYTHON_USEDEP}]
		>=dev-python/packaging-25.0[${PYTHON_USEDEP}]
		>=dev-python/pathspec-0.9.0[${PYTHON_USEDEP}]
		>=dev-python/pendulum-3.1.0[${PYTHON_USEDEP}]
		>=dev-python/pluggy-1.5.0[${PYTHON_USEDEP}]
		>=dev-python/psutil-5.8.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.11.0[${PYTHON_USEDEP}]
		>=dev-python/pygments-2.0.1[${PYTHON_USEDEP}]
		>=dev-python/pyjwt-2.11.0[${PYTHON_USEDEP}]
		>=dev-python/python-daemon-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/python-dateutil-2.7.0[${PYTHON_USEDEP}]
		>=dev-python/python-slugify-5.0[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.0[${PYTHON_USEDEP}]
		<dev-python/requests-3[${PYTHON_USEDEP}]
		>=dev-python/rich-argparse-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/rich-13.6.0[${PYTHON_USEDEP}]
		>=dev-python/setproctitle-1.3.3[${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-2.0.48[${PYTHON_USEDEP}]
		>=dev-python/svcs-25.1.0[${PYTHON_USEDEP}]
		>=dev-python/tabulate-0.9.0[${PYTHON_USEDEP}]
		>=dev-python/tenacity-8.3.0[${PYTHON_USEDEP}]
		>=dev-python/termcolor-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.14.1[${PYTHON_USEDEP}]
		>=dev-python/universal-pathlib-0.3.8[${PYTHON_USEDEP}]
		>=dev-python/uuid6-2024.7.10[${PYTHON_USEDEP}]
		>=dev-python/apache-airflow-task-sdk-1.2.2[${PYTHON_USEDEP}]
		>=dev-python/apache-airflow-providers-common-compat-1.7.4[${PYTHON_USEDEP}]
		>=dev-python/apache-airflow-providers-common-io-1.6.3[${PYTHON_USEDEP}]
		>=dev-python/apache-airflow-providers-common-sql-1.28.1[${PYTHON_USEDEP}]
		>=dev-python/apache-airflow-providers-smtp-2.3.1[${PYTHON_USEDEP}]
		>=dev-python/apache-airflow-providers-standard-1.9.0[${PYTHON_USEDEP}]
		>=dev-python/msgspec-0.19.0[${PYTHON_USEDEP}]
		>=dev-python/pygtrie-2.5.0[${PYTHON_USEDEP}]
		>=dev-python/structlog-25.4.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.3[${PYTHON_USEDEP}]
		graphviz? ( >=dev-python/graphviz-0.20[${PYTHON_USEDEP}] )
		gunicorn? ( >=www-servers/gunicorn-23.0.0[${PYTHON_USEDEP}] )
		statsd? ( >=dev-python/statsd-3.3.0[${PYTHON_USEDEP}] )
	')
"

RESTRICT="test"
