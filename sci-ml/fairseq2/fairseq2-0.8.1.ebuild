# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="FAIR Sequence Modeling Toolkit 2"
HOMEPAGE="https://github.com/facebookresearch/fairseq2"
SRC_URI="
	https://github.com/facebookresearch/fairseq2/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	~sci-ml/fairseq2n-${PV}[python,${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.32[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/tensorboard-2.20[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.57[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/clusterscope-0.0.31[${PYTHON_USEDEP}]
		>=dev-python/editdistance-0.8[${PYTHON_USEDEP}]
		>=dev-python/fsspec-2024.1[${PYTHON_USEDEP}]
		>=dev-python/importlib-metadata-7.0[${PYTHON_USEDEP}]
		>=dev-python/importlib-resources-6.4[${PYTHON_USEDEP}]
		>=dev-python/mypy-extensions-1.0[${PYTHON_USEDEP}]
		>=dev-python/packaging-24.1[${PYTHON_USEDEP}]
		>=dev-python/psutil-5.9[${PYTHON_USEDEP}]
		>=dev-python/ruamel-yaml-0.18[${PYTHON_USEDEP}]
		>=dev-python/rich-14.2[${PYTHON_USEDEP}]
		>=dev-python/sacrebleu-2.4[${PYTHON_USEDEP}]
		>=dev-python/s3fs-2024.1[${PYTHON_USEDEP}]
		>=dev-python/tiktoken-0.12.0[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.12[${PYTHON_USEDEP}]
		>=dev-python/wandb-0.22.0[${PYTHON_USEDEP}]
		>=sci-ml/safetensors-0.6[${PYTHON_USEDEP}]
		>=sci-ml/torcheval-0.0.6[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"
