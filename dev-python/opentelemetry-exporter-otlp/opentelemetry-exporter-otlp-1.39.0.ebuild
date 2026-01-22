# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

MY_P="opentelemetry-python-${PV}"

DESCRIPTION="OpenTelemetry Collector Exporters"
HOMEPAGE="
	https://pypi.org/project/opentelemetry-exporter-otlp/
"
SRC_URI="https://github.com/open-telemetry/opentelemetry-python/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/opentelemetry-exporter-otlp-proto-grpc-${PV}[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-exporter-otlp-proto-http-${PV}[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/${MY_P}/exporter/${PN}
