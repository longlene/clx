# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Multi-stage pipeline framework for omni models"
HOMEPAGE="https://github.com/sgl-project/sglang-omni"
SRC_URI="https://github.com/sgl-project/sglang-omni/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchvision[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchaudio[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchcodec[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/accelerate-0.27.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.36.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/datasets-2.14.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/sglang[${PYTHON_SINGLE_USEDEP}]
	sci-ml/kernels[${PYTHON_SINGLE_USEDEP}]
	sci-ml/nixl[${PYTHON_SINGLE_USEDEP}]
	sci-ml/mooncake-transfer-engine[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/silero-vad-5.1[${PYTHON_SINGLE_USEDEP}]
	sci-ml/openai-whisper[${PYTHON_SINGLE_USEDEP}]
	sci-ml/diffusers[${PYTHON_SINGLE_USEDEP}]
	sci-ml/x-transformers[${PYTHON_SINGLE_USEDEP}]
	>=dev-python/s3prl-0.4.18[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/pyzmq-25.0.0[${PYTHON_USEDEP}]
		>=dev-python/msgpack-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.24.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=sci-ml/safetensors-0.4.3[${PYTHON_USEDEP}]
		>=dev-python/pillow-10.0.0[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.110.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.23.0[${PYTHON_USEDEP}]
		sci-ml/flash-attn[${PYTHON_USEDEP}]
		dev-python/httpx[${PYTHON_USEDEP}]
		>=dev-python/xxhash-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/av-16.1.0[${PYTHON_USEDEP}]
		>=sci-ml/qwen-vl-utils-0.0.11[${PYTHON_USEDEP}]
		dev-python/numba[${PYTHON_USEDEP}]
		>=dev-python/librosa-0.11.0[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/tabulate[${PYTHON_USEDEP}]
		>=dev-python/typer-0.9.0[${PYTHON_USEDEP}]
		dev-python/openai[${PYTHON_USEDEP}]
		dev-python/openai-harmony[${PYTHON_USEDEP}]
		>=dev-python/soundfile-0.12.0[${PYTHON_USEDEP}]
		>=dev-python/mistral-common-1.11.0[${PYTHON_USEDEP}]
		>=dev-python/onnxruntime-1.17[${PYTHON_USEDEP}]
		>=dev-python/websockets-12.0[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.10.0[${PYTHON_USEDEP}]
		dev-python/jiwer[${PYTHON_USEDEP}]
		dev-python/tiktoken[${PYTHON_USEDEP}]
		dev-python/hydra-core[${PYTHON_USEDEP}]
		dev-python/omegaconf[${PYTHON_USEDEP}]
		dev-python/descript-audiotools[${PYTHON_USEDEP}]
		dev-python/descript-audio-codec[${PYTHON_USEDEP}]
		>=dev-python/gradio-4.0.0[${PYTHON_USEDEP}]
	')
"
