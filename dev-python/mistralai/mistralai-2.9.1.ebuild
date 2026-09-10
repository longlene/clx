# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Python client library for the Mistral AI platform"
HOMEPAGE="https://github.com/mistralai/client-python"
SRC_URI="https://github.com/mistralai/client-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/client-python-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/eval-type-backport-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.11.2[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.2[${PYTHON_USEDEP}]
	>=dev-python/typing-inspection-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.33.1[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-semantic-conventions-0.60_beta1[${PYTHON_USEDEP}]
	>=dev-python/jsonpath-python-1.0.6[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
