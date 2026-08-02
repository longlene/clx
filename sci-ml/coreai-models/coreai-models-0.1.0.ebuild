# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Core AI model export, evaluation, and building blocks for on-device ML"
HOMEPAGE="https://github.com/apple/coreai-models"
SRC_URI="https://github.com/apple/coreai-models/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${P}/python"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=sci-ml/pytorch-2.9.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/accelerate-1.12.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.57.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.34.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/tokenizers-0.22.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/diffusers-0.37.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/coreai-core[${PYTHON_SINGLE_USEDEP}]
	sci-ml/coreai-torch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/coreai-opt[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/numpy-2.2[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.67.0[${PYTHON_USEDEP}]
		>=dev-python/rich-14.0.0[${PYTHON_USEDEP}]
		>=sci-ml/safetensors-0.5.0[${PYTHON_USEDEP}]
		>=sci-ml/sentencepiece-0.2.0[python(+),${PYTHON_USEDEP}]
	')
"
