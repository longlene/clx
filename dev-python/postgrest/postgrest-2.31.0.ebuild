# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="PostgREST client for Python with ORM interface"
HOMEPAGE="https://pypi.org/project/postgrest/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/httpx-0.26[${PYTHON_USEDEP}]
	>=dev-python/deprecation-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.9[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.20.1[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/uv-build-0.8.3[${PYTHON_USEDEP}]
"
