# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="OpenAI-compatible LLM inference server for Apple Silicon using MLX"
HOMEPAGE="https://github.com/waybarrios/vllm-mlx"
SRC_URI="https://github.com/waybarrios/vllm-mlx/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="audio"
RESTRICT="test"

RDEPEND="
	>=sci-ml/mlx-lm-0.31.3[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/mlx-vlm-0.6.2[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-5.0.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/tokenizers-0.19.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.23.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/mlx-embeddings-0.0.5[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/torchvision-0.23.0[${PYTHON_SINGLE_USEDEP}]
	>=dev-python/gradio-4.0.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/starlette-1.0.1[${PYTHON_USEDEP}]
		>=sci-ml/mlx-0.29.0[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.24.0[${PYTHON_USEDEP}]
		>=dev-python/pillow-10.0.0[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.66.0[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		>=dev-python/requests-2.28.0[${PYTHON_USEDEP}]
		>=dev-python/tabulate-0.9.0[${PYTHON_USEDEP}]
		>=media-libs/opencv-4.8.0[python,${PYTHON_USEDEP}]
		>=dev-python/psutil-5.9.0[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.100.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.23.0[${PYTHON_USEDEP}]
		>=dev-python/prometheus-client-0.20.0[${PYTHON_USEDEP}]
		>=dev-python/mcp-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/jsonschema-4.0.0[${PYTHON_USEDEP}]
		>=sci-ml/lm-format-enforcer-0.10.9[${PYTHON_USEDEP}]
		>=dev-python/pytz-2024.1[${PYTHON_USEDEP}]
		audio? (
			>=sci-ml/mlx-audio-0.2.9[${PYTHON_USEDEP}]
			>=dev-python/sounddevice-0.4.0[${PYTHON_USEDEP}]
			>=dev-python/soundfile-0.12.0[${PYTHON_USEDEP}]
			>=dev-python/scipy-1.10.0[${PYTHON_USEDEP}]
			>=dev-python/numba-0.57.0[${PYTHON_USEDEP}]
			>=dev-python/tiktoken-0.5.0[${PYTHON_USEDEP}]
			>=dev-python/spacy-3.7.0[${PYTHON_USEDEP}]
			>=dev-python/num2words-0.5.0[${PYTHON_USEDEP}]
			>=dev-python/loguru-0.7.0[${PYTHON_USEDEP}]
			>=sci-ml/phonemizer-3.2.0[${PYTHON_USEDEP}]
			>=dev-python/jieba-0.42.0[${PYTHON_USEDEP}]
			>=dev-python/fugashi-1.3.0[${PYTHON_USEDEP}]
			>=dev-python/ordered-set-4.1.0[${PYTHON_USEDEP}]
			>=dev-python/cn2an-0.5.0[${PYTHON_USEDEP}]
			>=dev-python/unidic-lite-1.0.0[${PYTHON_USEDEP}]
		)
	')
"
