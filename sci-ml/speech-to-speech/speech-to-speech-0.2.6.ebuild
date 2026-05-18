# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Low-latency speech-to-speech pipeline"
HOMEPAGE="https://github.com/huggingface/speech-to-speech"
SRC_URI="https://github.com/huggingface/speech-to-speech/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-2.4.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/torchaudio-2.4.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.57.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/faster-qwen3-tts-0.2.6[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/nano-parakeet-0.2.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/fastapi-0.115.0[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.28.0[${PYTHON_USEDEP}]
		>=dev-python/nltk-3.9.4[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.26.0[${PYTHON_USEDEP}]
		>=dev-python/openai-2.28.0[${PYTHON_USEDEP}]
		>=dev-python/pillow-10.0.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
		>=dev-python/rich-13.0[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.10.0[${PYTHON_USEDEP}]
		>=dev-python/sounddevice-0.5.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.30.0[${PYTHON_USEDEP}]
		>=dev-python/websockets-12.0[${PYTHON_USEDEP}]
		dev-python/lingua-language-detector[${PYTHON_USEDEP}]
	')
"
		#>=dev-python/lingua-language-detector-2.0.2[${PYTHON_USEDEP}]
BDEPEND=""

RESTRICT="test"
