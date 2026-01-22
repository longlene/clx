# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

MY_PV="${PV/_p/b}"
MY_P="opentelemetry-python-contrib-${MY_PV}"

DESCRIPTION="OpenTelemetry requests instrumentation"
HOMEPAGE="
	https://pypi.org/project/opentelemetry-instrumentation-requests/
"
SRC_URI="https://github.com/open-telemetry/opentelemetry-python-contrib/archive/refs/tags/v${MY_PV}.tar.gz -> ${MY_P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/opentelemetry-api-1.12[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-instrumentation-0.60[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-semantic-conventions-0.60[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-util-http-0.60[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/${MY_P}/instrumentation/${PN}
