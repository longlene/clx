# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Supabase client for Python"
HOMEPAGE="https://github.com/supabase/supabase-py"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	~dev-python/realtime-2.31.0[${PYTHON_USEDEP}]
	~dev-python/supabase-functions-2.31.0[${PYTHON_USEDEP}]
	~dev-python/storage3-2.31.0[${PYTHON_USEDEP}]
	~dev-python/supabase-auth-2.31.0[${PYTHON_USEDEP}]
	~dev-python/postgrest-2.31.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.26[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.22.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/uv-build-0.8.3[${PYTHON_USEDEP}]
"
