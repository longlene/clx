# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{13..15} )

PYPI_PN="supabase_functions"

inherit distutils-r1 pypi

DESCRIPTION="Library for Supabase Functions"
HOMEPAGE="https://pypi.org/project/supabase_functions/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/httpx-0.26[${PYTHON_USEDEP}]
	>=dev-python/strenum-0.4.15[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.20.1[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/uv-build-0.8.3[${PYTHON_USEDEP}]
"
