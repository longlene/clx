# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Remember Me, Refine Me - AI memory agent framework"
HOMEPAGE="
	https://github.com/agentscope-ai/ReMe
	https://pypi.org/project/reme-ai/
"

S="${WORKDIR}/reme_ai-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="core"

RDEPEND="
	>=dev-python/aiofiles-24.1.0[${PYTHON_USEDEP}]
	>=dev-python/croniter-2.0[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.135.1[${PYTHON_USEDEP}]
	>=dev-python/fastmcp-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	>=dev-python/loguru-0.7.3[${PYTHON_USEDEP}]
	>=dev-python/mistletoe-1.5.1[${PYTHON_USEDEP}]
	>=dev-python/numpy-2.2.6[${PYTHON_USEDEP}]
	>=dev-python/openai-2.26.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.12.5[${PYTHON_USEDEP}]
	>=dev-python/python-frontmatter-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.3[${PYTHON_USEDEP}]
	>=dev-python/rich-14.3.3[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.41.0[${PYTHON_USEDEP}]
	>=dev-python/watchfiles-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/zstandard-0.23.0[${PYTHON_USEDEP}]
	core? (
		>=sci-ml/agentscope-2.0.2
		>=dev-python/jieba-0.42.1[${PYTHON_USEDEP}]
		>=dev-python/rjieba-0.2.1[${PYTHON_USEDEP}]
		>=dev-python/neo4j-6.2.0[${PYTHON_USEDEP}]
		>=dev-python/networkx-3.4.2[${PYTHON_USEDEP}]
		sci-ml/faiss[python,${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
