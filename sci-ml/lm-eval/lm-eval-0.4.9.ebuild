# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A framework for evaluating language models"
HOMEPAGE="https://github.com/EleutherAI/lm-evaluation-harness"
SRC_URI="https://github.com/EleutherAI/lm-evaluation-harness/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/accelerate-0.26.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/datasets-2.16.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/evaluate-0.4.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/peft-0.2.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-1.8.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.1[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/jsonlines[${PYTHON_USEDEP}]
		dev-python/numexpr[${PYTHON_USEDEP}]
		>=dev-python/pybind11-2.6.2[${PYTHON_USEDEP}]
		dev-python/pytablewriter[${PYTHON_USEDEP}]
		>=dev-python/rouge-score-0.0.4[${PYTHON_USEDEP}]
		>=dev-python/sacrebleu-1.5.0[${PYTHON_USEDEP}]
		>=dev-python/scikit-learn-0.24.1[${PYTHON_USEDEP}]
		dev-python/sqlitedict[${PYTHON_USEDEP}]
		dev-python/tqdm-multiprocess[${PYTHON_USEDEP}]
		dev-python/zstandard[${PYTHON_USEDEP}]
		dev-python/dill[${PYTHON_USEDEP}]
		dev-python/word2number[${PYTHON_USEDEP}]
		dev-python/more-itertools[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

#distutils_enable_tests pytest

RESTRICT="test"

S="${WORKDIR}"/lm-evaluation-harness-${PV}

