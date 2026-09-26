# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Developer-friendly load testing framework"
HOMEPAGE="https://locust.io/ https://github.com/locustio/locust https://pypi.org/project/locust/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="dns milvus mqtt otel qdrant"
RESTRICT="test"

BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
"

RDEPEND="
	>=dev-python/configargparse-1.7.1[${PYTHON_USEDEP}]
	>=dev-python/flask-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/flask-cors-3.0.10[${PYTHON_USEDEP}]
	>=dev-python/flask-login-0.6.3[${PYTHON_USEDEP}]
	>=dev-python/gevent-24.10.1[${PYTHON_USEDEP}]
	>=dev-python/geventhttpclient-2.3.1[${PYTHON_USEDEP}]
	>=dev-python/msgpack-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.9.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-8.3.3[${PYTHON_USEDEP}]
	<dev-python/pytest-10[${PYTHON_USEDEP}]
	>=dev-python/python-engineio-4.12.2[${PYTHON_USEDEP}]
	>=dev-python/python-socketio-5.13.0[${PYTHON_USEDEP}]
	>=dev-python/pyzmq-25.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.2[${PYTHON_USEDEP}]
	>=dev-python/werkzeug-2.0.0[${PYTHON_USEDEP}]
	dns? ( >=dev-python/dnspython-2.8.0[${PYTHON_USEDEP}] )
	milvus? ( >=dev-python/pymilvus-2.5.0[${PYTHON_USEDEP}] )
	mqtt? ( >=dev-python/paho-mqtt-2.1.0[${PYTHON_USEDEP}] )
	otel? (
		>=dev-python/opentelemetry-exporter-otlp-proto-grpc-1.38.0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-exporter-otlp-proto-http-1.38.0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-instrumentation-requests-0.59_beta0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-instrumentation-urllib3-0.59_beta0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-sdk-1.38.0[${PYTHON_USEDEP}]
	)
	qdrant? ( >=dev-python/qdrant-client-1.16.2[${PYTHON_USEDEP}] )
"

python_prepare_all() {
	export SETUPTOOLS_SCM_PRETEND_VERSION="${PV}"
	distutils-r1_python_prepare_all
}
