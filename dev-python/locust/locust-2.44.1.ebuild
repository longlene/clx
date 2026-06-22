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
KEYWORDS="~amd64"
IUSE="dns mqtt otel"
RESTRICT="test"

BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/configargparse[${PYTHON_USEDEP}]
		dev-python/flask[${PYTHON_USEDEP}]
		dev-python/flask-cors[${PYTHON_USEDEP}]
		dev-python/flask-login[${PYTHON_USEDEP}]
		>=dev-python/msgpack-1.0.0[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		>=dev-python/python-engineio-4.12.2[${PYTHON_USEDEP}]
		>=dev-python/python-socketio-5.13.0[${PYTHON_USEDEP}]
		dev-python/pyzmq[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.2[${PYTHON_USEDEP}]
		dev-python/werkzeug[${PYTHON_USEDEP}]
		dns? ( dev-python/dnspython[${PYTHON_USEDEP}] )
		mqtt? ( dev-python/paho-mqtt[${PYTHON_USEDEP}] )
		otel? (
			dev-python/opentelemetry-exporter-otlp-proto-grpc[${PYTHON_USEDEP}]
			dev-python/opentelemetry-exporter-otlp-proto-http[${PYTHON_USEDEP}]
			dev-python/opentelemetry-instrumentation-requests[${PYTHON_USEDEP}]
			>=dev-python/opentelemetry-sdk-1.38.0[${PYTHON_USEDEP}]
		)
	')
"

python_prepare_all() {
	export SETUPTOOLS_SCM_PRETEND_VERSION="${PV}"
	distutils-r1_python_prepare_all
}
