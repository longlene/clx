# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Instrument your FastAPI with Prometheus metrics"
HOMEPAGE="
	https://pypi.org/project/prometheus-fastapi-instrumentator/
	https://github.com/trallnag/prometheus-fastapi-instrumentator
"
SRC_URI="https://github.com/trallnag/prometheus-fastapi-instrumentator/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/starlette-0.30.0[${PYTHON_USEDEP}]
	>=dev-python/prometheus-client-0.8.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
