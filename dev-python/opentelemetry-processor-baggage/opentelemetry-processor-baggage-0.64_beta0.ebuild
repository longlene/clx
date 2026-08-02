# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

PYPI_PV="${PV/_beta/b}"

inherit distutils-r1 pypi

DESCRIPTION="OpenTelemetry Baggage Span Processor"
HOMEPAGE="https://github.com/open-telemetry/opentelemetry-python-contrib https://pypi.org/project/opentelemetry-processor-baggage/"

S="${WORKDIR}/opentelemetry_processor_baggage-${PYPI_PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/opentelemetry-api[${PYTHON_USEDEP}]
	dev-python/opentelemetry-sdk[${PYTHON_USEDEP}]
	dev-python/wrapt[${PYTHON_USEDEP}]
"
EPYTEST_PLUGINS=()

distutils_enable_tests pytest
