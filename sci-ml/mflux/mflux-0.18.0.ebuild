# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="MLX native implementations of state-of-the-art generative image models"
HOMEPAGE="https://github.com/filipstrand/mflux"
SRC_URI="https://github.com/filipstrand/mflux/archive/refs/tags/v.${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/${PN}-v.${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=sci-ml/huggingface_hub-1.1.6[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/tokenizers-0.20.3[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-2.7.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-5.0.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/filelock-3.20.1[${PYTHON_USEDEP}]
		>=dev-python/fonttools-4.60.2[${PYTHON_USEDEP}]
		>=dev-python/hf-transfer-0.1.9[${PYTHON_USEDEP}]
		>=dev-python/matplotlib-3.9.2[${PYTHON_USEDEP}]
		>=sci-ml/mlx-0.27.0[${PYTHON_USEDEP}]
		>=dev-python/numpy-2.0.1[${PYTHON_USEDEP}]
		>=media-libs/opencv-4.10.0[python,${PYTHON_USEDEP}]
		>=dev-python/piexif-1.1.3[${PYTHON_USEDEP}]
		>=dev-python/pillow-12.1.1[${PYTHON_USEDEP}]
		>=dev-python/platformdirs-4.0[${PYTHON_USEDEP}]
		>=dev-python/regex-2024.11.6[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.4[${PYTHON_USEDEP}]
		>=sci-ml/safetensors-0.4.4[${PYTHON_USEDEP}]
		>=sci-ml/sentencepiece-0.2.1[${PYTHON_USEDEP}]
		>=dev-python/toml-0.10.2[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.66.5[${PYTHON_USEDEP}]
		>=dev-python/twine-6.1.0[${PYTHON_USEDEP}]
		>=dev-python/urllib3-2.6.0[${PYTHON_USEDEP}]
		>=dev-python/protobuf-4.25.0[${PYTHON_USEDEP}]
	')
"
