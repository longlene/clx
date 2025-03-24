# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="State-of-the-art Parameter-Efficient Fine-Tuning"
HOMEPAGE="https://github.com/huggingface/peft"
SRC_URI="https://github.com/huggingface/peft/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/accelerate[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=sci-ml/pytorch-1.13.0[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.17[${PYTHON_USEDEP}]
		>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		sci-ml/safetensors[${PYTHON_USEDEP}]
		>=sci-ml/huggingface_hub-0.25.0[${PYTHON_USEDEP}]
	')
"
BDEPEND=""

RESTRICT="test"
