# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13,14} )

inherit distutils-r1

DESCRIPTION="Self-hosted AI code reviewer with PR reviews and vulnerability scanning"
HOMEPAGE="https://docs.miracode.ai https://github.com/miracodeai/mira"
SRC_URI="https://github.com/miracodeai/mira/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="serve"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/click-8.1[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.27[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.1[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.5[${PYTHON_USEDEP}]
		>=dev-python/pygithub-2.1[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/tenacity-8.2[${PYTHON_USEDEP}]
		>=dev-python/tiktoken-0.6[${PYTHON_USEDEP}]
		>=dev-python/unidiff-0.7[${PYTHON_USEDEP}]
		serve? (
			>=dev-python/fastapi-0.110[${PYTHON_USEDEP}]
			>=dev-python/pyjwt-2.8[${PYTHON_USEDEP}]
			>=dev-python/psycopg-3.1[${PYTHON_USEDEP}]
			>=dev-python/uvicorn-0.28[${PYTHON_USEDEP}]
		)
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		test? (
			dev-python/pytest-asyncio[${PYTHON_USEDEP}]
			dev-python/pytest-cov[${PYTHON_USEDEP}]
			dev-python/pytest-mock[${PYTHON_USEDEP}]
		)
	')
"

distutils_enable_tests pytest
