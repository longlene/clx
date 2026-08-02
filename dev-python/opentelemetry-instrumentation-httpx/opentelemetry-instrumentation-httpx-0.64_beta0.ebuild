# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

PYPI_PV="${PV/_beta/b}"

inherit distutils-r1 pypi

DESCRIPTION="OpenTelemetry HTTPX Instrumentation"
HOMEPAGE="https://github.com/open-telemetry/opentelemetry-python-contrib https://pypi.org/project/opentelemetry-instrumentation-httpx/"

S="${WORKDIR}/opentelemetry_instrumentation_httpx-${PYPI_PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
# tests require opentelemetry-test-utils which is not packaged
RESTRICT="test"

RDEPEND="
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/opentelemetry-api[${PYTHON_USEDEP}]
	dev-python/opentelemetry-instrumentation[${PYTHON_USEDEP}]
	dev-python/opentelemetry-semantic-conventions[${PYTHON_USEDEP}]
	dev-python/opentelemetry-util-http[${PYTHON_USEDEP}]
	dev-python/wrapt[${PYTHON_USEDEP}]
"
