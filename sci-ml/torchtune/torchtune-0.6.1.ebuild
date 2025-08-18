# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )
inherit distutils-r1

DESCRIPTION="PyTorch native finetuning library"
HOMEPAGE="https://pytorch.org/torchtune"
SRC_URI="
	https://github.com/pytorch/torchtune/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchdata[${PYTHON_SINGLE_USEDEP}]
	sci-ml/datasets[${PYTHON_SINGLE_USEDEP}]
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tokenziers[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		sci-ml/safetensors[${PYTHON_USEDEP}]
		dev-python/kagglehub[${PYTHON_USEDEP}]
		dev-python/sentencepiece[${PYTHON_USEDEP}]
		dev-python/tiktoken[${PYTHON_USEDEP}]
		>=dev-python/blobfile-2[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/omegaconf[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		>=dev-python/pillow-9.4.0[${PYTHON_USEDEP}]
	')
"
BDEPEND=""

distutils_enable_tests pytest

