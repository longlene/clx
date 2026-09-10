# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1

DESCRIPTION="A framework for efficient model inference with omni-modality models"
HOMEPAGE="
	https://pypi.org/project/vllm-omni/
	https://github.com/vllm-project/vllm-omni
"
SRC_URI="
	https://github.com/vllm-project/vllm-omni/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/transformers-5.10.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/diffusers-0.40.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/accelerate-1.12.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/cache-dit-1.5.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/openai-whisper-2025.06.25[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/x-transformers-2.12.2[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/torchsde-0.2.6[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/safetensors-0.8.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/kernels-0.14.1[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/av-14.0.0[${PYTHON_USEDEP}]
		>=dev-python/omegaconf-2.3.0[${PYTHON_USEDEP}]
		>=dev-python/soundfile-0.13.1[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.66.0[${PYTHON_USEDEP}]
		>=dev-python/imageio-2.37.2[${PYTHON_USEDEP}]
		>=dev-python/einops-0.8.1[${PYTHON_USEDEP}]
		>=dev-python/prettytable-3.8.0[${PYTHON_USEDEP}]
		>=dev-python/aenum-3.1.16[${PYTHON_USEDEP}]
		>=dev-python/pyzmq-25.0.0[${PYTHON_USEDEP}]
		>=dev-python/janus-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/msgpack-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.1.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-settings-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/gguf-0.10.0[${PYTHON_USEDEP}]
		>=dev-python/cosmos-guardrail-0.3.1[${PYTHON_USEDEP}]
	')
"

BDEPEND="$(python_gen_cond_dep 'dev-python/setuptools-scm[${PYTHON_USEDEP}]')"

RESTRICT="test"

export SETUPTOOLS_SCM_PRETEND_VERSION="${PV}"
