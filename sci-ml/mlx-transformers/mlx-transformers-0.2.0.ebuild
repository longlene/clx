# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="MLX-based transformer models with HuggingFace-compatible interface"
HOMEPAGE="https://github.com/ToluClassics/mlx-transformers"
SRC_URI="https://github.com/ToluClassics/mlx-transformers/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=sci-ml/datasets-2.19.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.22.2[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/tokenizers-0.19.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-2.2.2[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.57.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/numpy-1.26.4[${PYTHON_USEDEP}]
		>=dev-python/pillow-10.3.0[${PYTHON_USEDEP}]
		>=dev-python/streamlit-1.34.0[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.66.2[${PYTHON_USEDEP}]
		>=sci-ml/mlx-0.31.0[${PYTHON_USEDEP}]
		>=sci-ml/safetensors-0.4.3[${PYTHON_USEDEP}]
		sci-ml/sentencepiece[python(+),${PYTHON_USEDEP}]
	')
"
