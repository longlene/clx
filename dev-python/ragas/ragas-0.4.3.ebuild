# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Supercharge Your LLM Application Evaluations"
HOMEPAGE="
	https://pypi.org/project/ragas/
	https://github.com/vibrantlabsai/ragas
"
SRC_URI="https://github.com/vibrantlabsai/ragas/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/datasets-4.0.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/instructor[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/numpy-1.21.0[${PYTHON_USEDEP}]
		dev-python/tiktoken[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
		dev-python/nest-asyncio[${PYTHON_USEDEP}]
		dev-python/appdirs[${PYTHON_USEDEP}]
		>=dev-python/diskcache-5.6.3[${PYTHON_USEDEP}]
		dev-python/typer[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		>=dev-python/openai-1.0.0[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		>=dev-python/pillow-10.4.0[${PYTHON_USEDEP}]
		dev-python/networkx[${PYTHON_USEDEP}]
		dev-python/scikit-network[${PYTHON_USEDEP}]
		sci-ml/langchain[${PYTHON_USEDEP}]
		sci-ml/langchain-core[${PYTHON_USEDEP}]
		sci-ml/langchain-community[${PYTHON_USEDEP}]
		sci-ml/langchain-openai[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
