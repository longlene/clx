# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Open language modeling toolkit based on PyTorch"
HOMEPAGE="
	https://pypi.org/project/eole
	https://github.com/eole-nlp/eole
"
SRC_URI="https://github.com/eole-nlp/eole/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/ctranslate2-4.0.0[python]
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	sci-ml/datasets[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/tensorboard-2.18.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-2.8.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torch-optimi[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/configargparse[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-libs/fastText[python,${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		>=dev-python/protobuf-3.20.1[${PYTHON_USEDEP}]
		dev-python/pyahocorasick[${PYTHON_USEDEP}]
		>=sci-ml/tokenizer-1.37.0[python,${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/rapidfuzz[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-python/sacrebleu[${PYTHON_USEDEP}]
		sci-ml/safetensors[${PYTHON_USEDEP}]
		>=sci-ml/sentencepiece-0.1.94[${PYTHON_USEDEP}]
		dev-python/six[${PYTHON_USEDEP}]
		dev-python/spacy[${PYTHON_USEDEP}]
		>=sci-ml/subword-nmt-0.3.7[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/waitress[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
