# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Environments for LLM Reinforcement Learning"
HOMEPAGE="
	https://pypi.org/project/verifiers/
"
SRC_URI="https://github.com/PrimeIntellect-ai/verifiers/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/datasets-3.0.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/anthropic-0.78.0[${PYTHON_USEDEP}]
		>=dev-python/jinja22-3.1.6[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		>=dev-python/math-verify-0.8.0[${PYTHON_USEDEP}]
		>=dev-python/mcp-1.14.1[${PYTHON_USEDEP}]
		>=dev-python/nest-asyncio-1.6.0[${PYTHON_USEDEP}]
		>=dev-python/openai-1.108.1[${PYTHON_USEDEP}]
		>=dev-python/openai-agents-0.0.7[${PYTHON_USEDEP}]
		>=dev-python/prime-tunnel-0.1.6[${PYTHON_USEDEP}]
		>=dev-python/prime-sandboxes-0.2.25[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.11.9[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		>=dev-python/tenacity-8.5.0[${PYTHON_USEDEP}]
		dev-python/textual[${PYTHON_USEDEP}]
		dev-python/gepa[${PYTHON_USEDEP}]
		>=dev-python/pyzmq-27.1.0[${PYTHON_USEDEP}]
		>=dev-python/msgpack-1.1.2[${PYTHON_USEDEP}]
		>=dev-python/aiolimiter-1.2.1[${PYTHON_USEDEP}]
		>=dev-python/setproctitle-1.3.0[${PYTHON_USEDEP}]
		dev-python/regex[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
