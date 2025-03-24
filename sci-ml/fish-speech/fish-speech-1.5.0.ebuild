# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="SOTA Open Source TTS"
HOMEPAGE="https://github.com/fishaudio/fish-speech"
SRC_URI="https://github.com/fishaudio/fish-speech/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/datasets-2.18.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/tensorboard-2.14.1[${PYTHON_SINGLE_USEDEP}]
	sci-ml/faster-whisper[${PYTHON_SINGLE_USEDEP}]
	sci-ml/silero-vad[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/funasr-1.1.5[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=sci-ml/vector-quantize-pytorch-1.14.24[${PYTHON_USEDEP}]
		>=sci-ml/transformers-4.45.2[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.26.4[${PYTHON_USEDEP}]
		>=dev-python/hydra-1.3.2[${PYTHON_USEDEP}]
		>=dev-python/natsort-8.4.0[${PYTHON_USEDEP}]
		>=dev-python/einops-0.7.0[${PYTHON_USEDEP}]
		>=dev-python/librosa-0.10.1[${PYTHON_USEDEP}]
		>=dev-python/rich-13.5.3[${PYTHON_USEDEP}]
		>=dev-python/gradio-5.0.0[${PYTHON_USEDEP}]
		>=dev-python/wandb-0.15.11[${PYTHON_USEDEP}]
		>=dev-python/grpcio-1.58.0[${PYTHON_USEDEP}]
		>=dev-python/kui-1.6.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.30.0[${PYTHON_USEDEP}]
		>=dev-python/loguru-0.6.0[${PYTHON_USEDEP}]
		>=dev-python/loralib-0.1.2[${PYTHON_USEDEP}]
		>=dev-python/rootutils-1.0.4[${PYTHON_USEDEP}]
		>=dev-python/resampy-0.4.3[${PYTHON_USEDEP}]
		>=dev-python/einx-0.2.2[${PYTHON_USEDEP}]
		>=dev-python/zstandard-0.22.0[${PYTHON_USEDEP}]
		dev-python/pydub[${PYTHON_USEDEP}]
		dev-python/pyaudio[${PYTHON_USEDEP}]
		>=sci-ml/lightning-2.1.0[${PYTHON_USEDEP}]
		>=sci-ml/modelscope-1.17.1[${PYTHON_USEDEP}]
		>=dev-python/opencc-python-reimplemented-0.1.7[${PYTHON_USEDEP}]
		dev-python/ormsgpack[${PYTHON_USEDEP}]
		>=dev-python/tiktoken-0.8.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.9.2[${PYTHON_USEDEP}]
		dev-python/cachetools[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
