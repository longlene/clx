# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="MLX fine-tuning for LLMs on Apple Silicon with Unsloth-compatible API"
HOMEPAGE="https://github.com/ARahim3/mlx-tune"
SRC_URI="https://github.com/ARahim3/mlx-tune/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="audio"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=sci-ml/mlx-0.31.0[${PYTHON_USEDEP}]
	')
	>=sci-ml/mlx-lm-0.31.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/mlx-vlm-0.4.3[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.36.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/tokenizers-0.15.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/datasets-2.14.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/mlx-embeddings-0.1.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.20.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
	>=dev-python/numpy-1.23.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.65.0[${PYTHON_USEDEP}]
	audio? (
		>=sci-ml/mlx-audio-0.4.2[${PYTHON_USEDEP}]
		>=dev-python/soundfile-0.12.0[${PYTHON_USEDEP}]
		>=dev-python/librosa-0.10.0[${PYTHON_USEDEP}]
		>=dev-python/mistral-common-1.8.0[${PYTHON_USEDEP}]
	)
	')
"
