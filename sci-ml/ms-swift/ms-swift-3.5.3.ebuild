# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Scalable lightWeight Infrastructure for Fine-Tuning"
HOMEPAGE="
	https://pypi.org/project/ms-swift
	https://github.com/modelscope/ms-swift
"
SRC_URI="https://github.com/modelscope/ms-swift/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/accelerate[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/datasets-3.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/peft-0.11[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tensorboard[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.33[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers-stream-generator[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/trl-0.15[${PYTHON_SINGLE_USEDEP}]
	>=dev-python/gradio-3.40.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=sci-ml/modelscope-1.23[${PYTHON_USEDEP}]
		sci-ml/safetensors[${PYTHON_USEDEP}]
		dev-python/tiktoken[${PYTHON_USEDEP}]
		dev-python/addict[${PYTHON_USEDEP}]
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/attrdict[${PYTHON_USEDEP}]
		dev-python/binpacking[${PYTHON_USEDEP}]
		dev-python/charset-normalizer[${PYTHON_USEDEP}]
		dev-python/cpm-kernels[${PYTHON_USEDEP}]
		dev-python/dacite[${PYTHON_USEDEP}]
		dev-python/einops[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/importlib-metadata[${PYTHON_USEDEP}]
		dev-python/jieba[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/nltk[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/openai[${PYTHON_USEDEP}]
		dev-python/oss2[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/rouge[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		sci-ml/sentencepiece[python,${PYTHON_USEDEP}]
		>=dev-python/simplejson-3.3.0[${PYTHON_USEDEP}]
		>=dev-python/sortedcontainers-1.5.9[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/zstandard[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

src_prepare() {
	sed -e "s#get_version(),#'${PV}',#" \
		-i setup.py
	rm -rf tests
	distutils-r1_src_prepare
}
