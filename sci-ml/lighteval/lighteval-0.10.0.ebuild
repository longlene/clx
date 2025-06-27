# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )
inherit distutils-r1

DESCRIPTION="A lightweight and configurable evaluation package"
HOMEPAGE="
	https://github.com/huggingface/lighteval
"
SRC_URI="https://github.com/huggingface/lighteval/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+xet"

RDEPEND="
	>=sci-ml/pytorch-2.0.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/accelerate[${PYTHON_SINGLE_USEDEP}]
 	>=sci-ml/transformers-4.51.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.30.2[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/datasets-3.5.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
    	>=dev-python/gitpython-3.1.41[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		>=dev-python/numpy-2[${PYTHON_USEDEP}]
		dev-python/typer[${PYTHON_USEDEP}]
		>=dev-python/termcolor-2.3.0[${PYTHON_USEDEP}]
		dev-python/pytablewriter[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-python/colorlog[${PYTHON_USEDEP}]
		>=dev-python/aenum-3.1.15[${PYTHON_USEDEP}]
		>=dev-python/nltk-3.9.1[${PYTHON_USEDEP}]
		dev-python/scikit-learn[${PYTHON_USEDEP}]
		dev-python/sacrebleu[${PYTHON_USEDEP}]
		>=dev-python/rouge-score-0.1.2[${PYTHON_USEDEP}]
		>=sci-ml/sentencepiece-0.1.99[python,${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
		dev-python/pycountry[${PYTHON_USEDEP}]
		>=dev-python/fsspec-2023.12.2[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.27.2[${PYTHON_USEDEP}]
		>=dev-python/latex2sympy2-extended-1.0.6[${PYTHON_USEDEP}]
	')
"

BDEPEND=""

distutils_enable_tests pytest

