# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Lightweight LLMs Evaluation Framework"
HOMEPAGE="
	https://pypi.org/project/evalscope
	https://github.com/modelscope/evalscope
"
SRC_URI="https://github.com/modelscope/evalscope/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/accelerate[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/datasets-3.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.33[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/immutabledict[${PYTHON_USEDEP}]
		dev-python/jieba[${PYTHON_USEDEP}]
		dev-python/jsonlines[${PYTHON_USEDEP}]
		dev-python/langdetect[${PYTHON_USEDEP}]
		dev-python/latex2sympy2-extended[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/modelscope[${PYTHON_USEDEP}]
		>=dev-python/nltk-3.9[${PYTHON_USEDEP}]
		dev-python/openai[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/pyarrow[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/rouge-chinese[${PYTHON_USEDEP}]
		>=dev-python/rouge-score-0.1.0[${PYTHON_USEDEP}]
		dev-python/sacrebleu[${PYTHON_USEDEP}]
		dev-python/scikit-learn[${PYTHON_USEDEP}]
		dev-python/seaborn[${PYTHON_USEDEP}]
		dev-python/sympy[${PYTHON_USEDEP}]
		dev-python/tabulate[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/word2number[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
