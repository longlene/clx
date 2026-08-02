# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="A web framework for building products with Python"
HOMEPAGE="https://github.com/dropseed/plain"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/click-8.0.0[${PYTHON_USEDEP}]
	>=dev-python/h2-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.34.1[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-semantic-conventions-0.55_beta1[${PYTHON_USEDEP}]
	>=dev-python/watchfiles-0.18.0[${PYTHON_USEDEP}]
"
